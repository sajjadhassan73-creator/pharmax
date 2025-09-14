// lib/screens/purchases/purchases_screen.dart
import 'package:flutter/material.dart';
import 'package:pharmax/models/purchase_item.dart';
import 'package:pharmax/models/product_model.dart';
import 'package:pharmax/screens/purchases/widgets/purchase_row.dart';
import 'package:pharmax/database/app_database.dart'; // Import AppDatabase

class PurchasesScreen extends StatefulWidget {
  final AppDatabase db; // Add a final variable for the database

  const PurchasesScreen({
    Key? key,
    required this.db, // Require the database in the constructor
  }) : super(key: key);

  @override
  _PurchasesScreenState createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  // A mock list of purchase items to display in the table
  // You will replace this with real data from your database later
  List<PurchaseItem> _purchaseItems = [
    PurchaseItem(
      productId: 1,
      name: 'Amoxicillin 500mg',
      unit: 'Box',
      quantity: 50,
      cost: 10.5,
      price: 15.0,
      bonus: 5,
      profitPercentage: 42.86,
      expiry: DateTime(2026, 12, 31),
    ),
    PurchaseItem(
      productId: 2,
      name: 'Ibuprofen 200mg',
      unit: 'Bottle',
      quantity: 100,
      cost: 5.0,
      price: 8.5,
      bonus: 10,
      profitPercentage: 70.0,
      expiry: DateTime(2027, 06, 30),
    ),
  ];

  // A mock list of all products to simulate database access
  List<ProductModel> _allProducts = [
    ProductModel(
      id: 1,
      name: 'Amoxicillin 500mg',
      barcodes: ['12345'],
      unit: 'Box',
      primaryCost: 10.5,
      primaryPrice: 15.0,
    ),
    ProductModel(
      id: 2,
      name: 'Ibuprofen 200mg',
      barcodes: ['67890'],
      unit: 'Bottle',
      primaryCost: 5.0,
      primaryPrice: 8.5,
    ),
  ];

  void _updatePurchaseItem(int index, PurchaseItem updatedItem) {
    setState(() {
      _purchaseItems[index] = updatedItem;
    });
  }

  void _deletePurchaseItem(int index) {
    setState(() {
      _purchaseItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المشتريات'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // معلومات الفاتورة الأساسية
            TextFormField(
              decoration: InputDecoration(
                labelText: 'اسم المورد',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.person),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'رقم الفاتورة',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.receipt),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'التاريخ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.calendar_today),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 24),

            // جدول فاتورة المشتريات
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('التسلسل')),
                    DataColumn(label: Text('الرمز')),
                    DataColumn(label: Text('الاسم التجاري')),
                    DataColumn(label: Text('تاريخ النفاذ')),
                    DataColumn(label: Text('الكمية')),
                    DataColumn(label: Text('الوحدة')),
                    DataColumn(label: Text('الكلفة')),
                    DataColumn(label: Text('البونص')),
                    DataColumn(label: Text('الكلفة بعد البونص')),
                    DataColumn(label: Text('نسبة الربح')),
                    DataColumn(label: Text('السعر 1')),
                    DataColumn(label: Text('السعر 2')),
                  ],
                  // Corrected: passing the widget's database instance
                  rows: List<DataRow>.generate(
                    _purchaseItems.length,
                    (index) {
                      return buildPurchaseRow(
                        context: context,
                        db: widget.db, // Now passing the real db object
                        item: _purchaseItems[index],
                        index: index,
                        allProducts: _allProducts,
                        onUpdate: _updatePurchaseItem,
                        onDelete: _deletePurchaseItem,
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // المجاميع النهائية والخصم
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('مجموع الكلفة: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Text('0.0 د.ع',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('مجموع السعر: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Text('0.0 د.ع',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('الخصم:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('المجموع النهائي:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Text(
                  '0.0 د.ع',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // الأزرار
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.save),
                    label: const Text('حفظ'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                    label: const Text('حذف'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.print),
                    label: const Text('طباعة QR'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.history),
                    label: const Text('القوائم السابقة'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.pause),
                    label: const Text('القوائم المعلقة'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_circle),
                    label: const Text('الرصدة السالبة'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
