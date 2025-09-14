// lib/screens/purchases/widgets/purchase_cells.dart
//
// خلايا مشتركة لجدول المشتريات:
// - profitCell: عرض نسبة الربح (محسوبة تلقائياً).
// - priceCell: تعديل السعر1 يحسب نسبة الربح.
// - price2Cell: تعديل السعر2 يحسب السعر1 والنسبة.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/purchase_item.dart';
import '../../../models/product_model.dart';
import 'purchase_table_helpers.dart';

/// خلية نسبة الربح (عرض فقط - ناتج حساب)
Widget profitCell({
  required PurchaseItem item,
  required int index,
  required ProductModel prod,
  required void Function(int index, PurchaseItem updated) onUpdate,
}) {
  final profit = PurchaseTableHelpers.profitFromPrice(item, item.price);
  return Text(
    "${profit.toInt()} %",
    style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  );
}

/// خلية سعر البيع1 ↔ تحديث نسبة الربح تلقائي
Widget priceCell({
  required PurchaseItem item,
  required int index,
  required ProductModel prod,
  required void Function(int index, PurchaseItem updated) onUpdate,
}) {
  return TextFormField(
    key: ValueKey("price_${item.productId}_${item.unit}"),
    initialValue: item.price.toInt().toString(),
    keyboardType: TextInputType.number,
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly, // ✅ أرقام صحيحة فقط
    ],
    decoration: const InputDecoration(border: InputBorder.none, isDense: true),
    onChanged: (v) {
      final newPrice = int.tryParse(v) ?? item.price.toInt();
      final newProfit =
          PurchaseTableHelpers.profitFromPrice(item, newPrice.toDouble());

      onUpdate(
        index,
        item.copyWith(
          price: newPrice.toDouble(),
          profitPercentage: newProfit,
          price2: (prod.secondaryUnitName != null && prod.packing > 1)
              ? newPrice / prod.packing
              : null,
          isManualPrice: true,
        ),
      );
    },
  );
}

/// خلية سعر الوحدة الثانوية ↔ تحديث السعر1 والنسبة
Widget price2Cell({
  required PurchaseItem item,
  required int index,
  required ProductModel prod,
  required void Function(int index, PurchaseItem updated) onUpdate,
}) {
  final price2 = (prod.secondaryUnitName != null && prod.packing > 1)
      ? (item.price / prod.packing)
      : null;

  if (price2 == null) return const Text("");

  return TextFormField(
    key: ValueKey("price2_${item.productId}_${item.unit}"),
    initialValue: price2.toInt().toString(),
    keyboardType: TextInputType.number,
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly, // ✅ أرقام صحيحة فقط
    ],
    decoration: const InputDecoration(border: InputBorder.none, isDense: true),
    onChanged: (v) {
      final newPrice2 = int.tryParse(v) ?? price2.toInt();
      final newPrice = newPrice2 * prod.packing;
      final newProfit =
          PurchaseTableHelpers.profitFromPrice(item, newPrice.toDouble());

      onUpdate(
        index,
        item.copyWith(
          price: newPrice.toDouble(),
          profitPercentage: newProfit,
          price2: newPrice2.toDouble(),
          isManualPrice: true,
        ),
      );
    },
  );
}
