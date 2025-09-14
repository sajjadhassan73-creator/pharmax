import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/app_database.dart';
import 'products/products_screen.dart';
import 'suppliers/suppliers_screen.dart';
import 'customers/customers_screen.dart';
import 'purchases/purchases_screen.dart';
import 'sales/sales_screen.dart';

class DashboardScreen extends StatefulWidget {
  final String userCode;
  const DashboardScreen({super.key, required this.userCode});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late AppDatabase db;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    db = Provider.of<AppDatabase>(context);
  }

  void _openPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pharmax - مرحباً ${widget.userCode}')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTile(Icons.inventory_2, 'المنتجات', const ProductsScreen()),
          _buildTile(Icons.group, 'الموردين', const SuppliersScreen()),
          _buildTile(Icons.people, 'الزبائن', const CustomersScreen()),
          _buildTile(Icons.shopping_cart, 'المشتريات', const PurchasesScreen()),
          _buildTile(Icons.sell, 'المبيعات', const SalesScreen()),
          _buildTile(Icons.warning, 'النواقص', const Placeholder()),
          _buildTile(Icons.check_box, 'المهام', const Placeholder()),
          const SizedBox(height: 32),
          const Center(child: Text('لوحة التحكم')),
        ],
      ),
    );
  }

  Widget _buildTile(IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        debugPrint("✅ فتحنا صفحة: $title"); // 🟢 حتى نتأكد
        _openPage(page);
      },
    );
  }
}
