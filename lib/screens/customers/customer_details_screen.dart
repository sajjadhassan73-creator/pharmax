import 'package:flutter/material.dart';
import '../../models/customer_model.dart';

class CustomerDetailsScreen extends StatelessWidget {
  final CustomerModel customer;

  const CustomerDetailsScreen({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل الزبون - ${customer.name}'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTile('الاسم', customer.name),
          _buildTile('الهاتف', customer.phone ?? '-'),
          _buildTile('البريد', customer.email ?? '-'),
          _buildTile('العنوان', customer.address ?? '-'),
          _buildTile('ملاحظات', customer.notes ?? '-'),
          _buildTile('التاريخ المرضي', customer.medicalHistory ?? '-'),

          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 10),
          const Text('فواتير الزبون', style: TextStyle(fontSize: 18)),

          // TODO: استبدل هذا بـ ListView للفواتير من قاعدة البيانات لاحقًا
          const SizedBox(height: 10),
          const ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text('فاتورة رقم #001'),
            subtitle: Text('التاريخ: 2025-07-06'),
            trailing: Text('المجموع: 35,000'),
          ),
          const ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text('فاتورة رقم #002'),
            subtitle: Text('التاريخ: 2025-07-02'),
            trailing: Text('المجموع: 22,500'),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(title),
        subtitle: Text(value),
        leading: const Icon(Icons.info_outline),
      ),
    );
  }
}
