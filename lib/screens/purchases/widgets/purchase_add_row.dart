// lib/screens/purchases/widgets/purchase_add_row.dart
import 'package:flutter/material.dart';
import 'package:pharmax/database/app_database.dart';
import 'package:pharmax/models/product_model.dart';
import 'package:pharmax/models/purchase_item.dart';

class PurchaseAddRow extends StatelessWidget {
  const PurchaseAddRow({
    Key? key,
    required this.db,
    required this.initialProduct,
    required this.onAdd,
  }) : super(key: key);

  final AppDatabase db;
  final ProductModel initialProduct;
  final Function(PurchaseItem) onAdd;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('إضافة صنف'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text('المنتج: ${initialProduct.name}'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: () {
            final newItem = PurchaseItem(
              productId: initialProduct.id,
              name: initialProduct.name,
              unit: initialProduct.unit,
              quantity: 1,
              cost: initialProduct.primaryCost,
              price: initialProduct.primaryPrice,
              bonus: 0,
              profitPercentage: 0,
              expiry: DateTime.now().add(const Duration(days: 365)),
            );
            onAdd(newItem);
            Navigator.of(context).pop();
          },
          child: const Text('إضافة'),
        ),
      ],
    );
  }
}