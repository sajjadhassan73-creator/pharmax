// lib/screens/purchases/widgets/purchase_add_row.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/purchase_item.dart';
import '../../../models/product_model.dart';
import '../../../database/app_database.dart'; // 🟢 للوصول لقاعدة البيانات
import '../../products/add_product_dialog.dart'; // 🟢 نافذة إضافة منتج
import 'purchase_table_helpers.dart';

DataRow buildAddRow({
  required BuildContext context,
  required AppDatabase db,
  required List<ProductModel> allProducts,
  required void Function(PurchaseItem item) onAdd,
}) {
  final barcodeCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final expiryCtrl = TextEditingController(
    text: DateTime.now().toIso8601String().split('T').first,
  );
  final qtyCtrl = TextEditingController();
  final costCtrl = TextEditingController();
  final bonusCtrl = TextEditingController();
  final priceCtrl = TextEditingController();

  ProductModel? selectedProduct;
  String? selectedUnit;
  double liveCostAfterBonus = 0.0;
  double liveProfit = 0.0;
  double? livePrice2;

  return DataRow(
    cells: [
      const DataCell(Text("+")), // عمود الإضافة
      DataCell(
        TextField(
          controller: barcodeCtrl,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "الرمز",
          ),
        ),
      ),
      DataCell(
        TextField(
          controller: nameCtrl,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "الاسم التجاري",
          ),
        ),
      ),
      DataCell(
        TextField(
          controller: expiryCtrl,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.datetime,
        ),
      ),
      const DataCell(Text("وحدة")), // مؤقتًا
      DataCell(
        TextField(
          controller: qtyCtrl,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "0",
          ),
        ),
      ),
      DataCell(
        TextField(
          controller: costCtrl,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
          ],
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "0.00",
          ),
        ),
      ),
      DataCell(
        TextField(
          controller: bonusCtrl,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "0",
          ),
        ),
      ),
      DataCell(Text(liveCostAfterBonus.toStringAsFixed(2))),
      DataCell(Text(liveProfit.toStringAsFixed(2))),
      DataCell(
        TextField(
          controller: priceCtrl,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
          ],
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "0.00",
          ),
        ),
      ),
      const DataCell(Text("0.00")), // السعر 2
      const DataCell(Text("0.00")), // مجموع الكلفة
      const DataCell(Text("0.00")), // مجموع السعر
    ],
  );
}
