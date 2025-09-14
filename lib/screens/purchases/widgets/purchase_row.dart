// lib/screens/purchases/widgets/purchase_row.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../database/app_database.dart';
import '../../../models/purchase_item.dart';
import '../../../models/product_model.dart';
import 'purchase_table_helpers.dart';
import 'purchase_cells.dart';
import 'purchase_context_menu.dart';
import 'product_details_dialog.dart';

DataRow buildPurchaseRow({
  required BuildContext context,
  required AppDatabase db,
  required PurchaseItem item,
  required int index,
  required List<ProductModel> allProducts,
  required void Function(int index, PurchaseItem updated) onUpdate,
  required void Function(int index) onDelete,
}) {
  final costAfterBonus = PurchaseTableHelpers.costAfterBonus(item);
  final totalCostRow = costAfterBonus * item.quantity;
  final totalPriceRow = item.price * item.quantity;

  final prod = allProducts.firstWhere(
    (p) => (p.id ?? -1) == item.productId,
    orElse: () => ProductModel(
      id: null,
      barcodes: const [],
      name: '',
      unit: item.unit,
      primaryCost: 0,
      primaryPrice: 0,
    ),
  );

  final code = prod.barcodes.isNotEmpty
      ? prod.barcodes.first
      : item.productId.toString();

  final isPrimary = item.unit == prod.unit;
  final unitColor = isPrimary ? Colors.red : Colors.green;

  return DataRow(
    cells: [
      DataCell(_wrap(context, db, item, index, allProducts, onUpdate, onDelete,
          Text("${index + 1}"))),
      DataCell(_wrap(context, db, item, index, allProducts, onUpdate, onDelete,
          Text(code))),
      // الاسم التجاري 🟢 فقط هنا يشتغل الدبل كلك لتغيير الوحدة
      DataCell(_wrap(
        context,
        db,
        item,
        index,
        allProducts,
        onUpdate,
        onDelete,
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            item.name,
            key: ValueKey(item.name),
            style: const TextStyle(color: Colors.black87),
          ),
        ),
        enableDoubleTapForUnit: true,
      )),
      // تاريخ النفاذ
      DataCell(_wrap(
        context,
        db,
        item,
        index,
        allProducts,
        onUpdate,
        onDelete,
        Row(
          children: [
            Expanded(
              child: TextFormField(
                key: ValueKey("exp_${item.productId}_${item.unit}"),
                initialValue:
                    item.expiry?.toIso8601String().split('T').first ?? "",
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  hintText: "YYYY-MM-DD",
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d-]')),
                ],
                onChanged: (v) {
                  if (v.isEmpty) {
                    onUpdate(index, item.copyWith(expiry: null));
                    return;
                  }
                  try {
                    final d = DateTime.parse(v);
                    onUpdate(index, item.copyWith(expiry: d));
                  } catch (_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("⚠️ صيغة التاريخ يجب أن تكون YYYY-MM-DD"),
                        backgroundColor: Colors.redAccent,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today,
                  size: 18, color: Colors.blue),
              tooltip: "اختر من التقويم",
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: item.expiry ?? DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  onUpdate(index, item.copyWith(expiry: picked));
                }
              },
            ),
          ],
        ),
      )),
      // الوحدة
      DataCell(_wrap(
        context,
        db,
        item,
        index,
        allProducts,
        onUpdate,
        onDelete,
        DropdownButton<String>(
          key: ValueKey("unit_${item.productId}_${item.unit}"),
          value: item.unit,
          underline: const SizedBox.shrink(),
          isDense: true,
          style: TextStyle(
            color: unitColor,
            fontWeight: FontWeight.bold,
          ),
          items: PurchaseTableHelpers.unitOptions(prod, item.unit)
              .map((u) => DropdownMenuItem(
                    value: u,
                    child: Text(
                      u,
                      style: TextStyle(
                        color: (u == prod.unit) ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
              .toList(),
          onChanged: (val) {
            if (val == null) return;
            final newCost = PurchaseTableHelpers.unitCost(prod, val);
            final newPrice = PurchaseTableHelpers.unitPrice(prod, val);

            onUpdate(
              index,
              item.copyWith(
                unit: val,
                cost: newCost,
                price: newPrice,
                isManualPrice: false,
              ),
            );
          },
        ),
      )),
      // الكمية
      DataCell(_wrap(
        context,
        db,
        item,
        index,
        allProducts,
        onUpdate,
        onDelete,
        TextFormField(
          key: ValueKey("qty_${item.productId}_${item.unit}"),
          initialValue: item.quantity.toString(),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration:
              const InputDecoration(border: InputBorder.none, isDense: true),
          onChanged: (v) {
            final newQty = int.tryParse(v) ?? item.quantity;
            final newItem = item.copyWith(quantity: newQty);

            if (item.isManualPrice) {
              final newProfit =
                  PurchaseTableHelpers.profitFromPrice(newItem, item.price);
              onUpdate(
                index,
                newItem.copyWith(
                  profitPercentage: newProfit,
                  price: item.price,
                  isManualPrice: true,
                ),
              );
            } else {
              final newPrice = PurchaseTableHelpers.priceFrom(newItem);
              onUpdate(
                index,
                newItem.copyWith(price: newPrice, isManualPrice: false),
              );
            }
          },
        ),
      )),
      // الكلفة
      DataCell(_wrap(
        context,
        db,
        item,
        index,
        allProducts,
        onUpdate,
        onDelete,
        TextFormField(
          key: ValueKey("cost_${item.productId}_${item.unit}"),
          initialValue: item.cost.toStringAsFixed(2),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(
                RegExp(r'^\d{0,8}([.,]\d{0,2})?$')),
          ],
          decoration:
              const InputDecoration(border: InputBorder.none, isDense: true),
          onChanged: (v) {
            final newCost =
                double.tryParse(v.replaceAll(',', '.')) ?? item.cost;
            final newItem = item.copyWith(cost: newCost);

            if (item.isManualPrice) {
              final newProfit =
                  PurchaseTableHelpers.profitFromPrice(newItem, item.price);
              onUpdate(
                index,
                newItem.copyWith(
                  profitPercentage: newProfit,
                  price: item.price,
                  isManualPrice: true,
                ),
              );
            } else {
              final newPrice = PurchaseTableHelpers.priceFrom(newItem);
              onUpdate(
                index,
                newItem.copyWith(price: newPrice, isManualPrice: false),
              );
            }
          },
        ),
      )),
      // البونص
      DataCell(_wrap(
        context,
        db,
        item,
        index,
        allProducts,
        onUpdate,
        onDelete,
        TextFormField(
          key: ValueKey("bonus_${item.productId}_${item.unit}"),
          initialValue: item.bonus.toString(),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration:
              const InputDecoration(border: InputBorder.none, isDense: true),
          onChanged: (v) {
            final newBonus = int.tryParse(v) ?? item.bonus;
            final newItem = item.copyWith(bonus: newBonus);

            if (item.isManualPrice) {
              final newProfit =
                  PurchaseTableHelpers.profitFromPrice(newItem, item.price);
              onUpdate(
                index,
                newItem.copyWith(
                  profitPercentage: newProfit,
                  price: item.price,
                  isManualPrice: true,
                ),
              );
            } else {
              final newPrice = PurchaseTableHelpers.priceFrom(newItem);
              onUpdate(
                index,
                newItem.copyWith(price: newPrice, isManualPrice: false),
              );
            }
          },
        ),
      )),
      // الكلفة بعد البونص
      DataCell(_wrap(
        context,
        db,
        item,
        index,
        allProducts,
        onUpdate,
        onDelete,
        Text(costAfterBonus.toStringAsFixed(2),
            style: const TextStyle(color: Colors.blue)),
      )),
      // نسبة الربح
      DataCell(_wrap(
        context,
        db,
        item,
        index,
        allProducts,
        onUpdate,
        onDelete,
        profitCell(item: item, index: index, onUpdate: onUpdate),
      )),
      // سعر البيع
      DataCell(_wrap(
        context,
        db,
        item,
        index,
        allProducts,
        onUpdate,
        onDelete,
        priceCell(item: item, index: index, onUpdate: onUpdate),
      )),
      // مجموع الكلفة
      DataCell(_wrap(
        context,
        db,
        item,
        index,
        allProducts,
        onUpdate,
        onDelete,
        Text(totalCostRow.toStringAsFixed(2),
            style: const TextStyle(color: Colors.green)),
      )),
      // مجموع السعر
      DataCell(_wrap(
        context,
        db,
        item,
        index,
        allProducts,
        onUpdate,
        onDelete,
        Text(totalPriceRow.toStringAsFixed(2),
            style: const TextStyle(color: Colors.deepOrange)),
      )),
    ],
  );
}

Widget _wrap(
  BuildContext context,
  AppDatabase db,
  PurchaseItem item,
  int index,
  List<ProductModel> allProducts,
  void Function(int, PurchaseItem) onUpdate,
  void Function(int) onDelete,
  Widget child, {
  bool enableDoubleTapForUnit = false,
}) {
  final prod = allProducts.firstWhere((p) => (p.id ?? -1) == item.productId,
      orElse: () => ProductModel(
          id: null,
          barcodes: const [],
          name: '',
          unit: item.unit,
          primaryCost: 0,
          primaryPrice: 0));

  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onSecondaryTapDown: (details) {
      PurchaseContextMenu.show(
        context,
        index: index,
        item: item,
        allProducts: allProducts,
        db: db,
        onUpdate: onUpdate,
        onDelete: onDelete,
        position: details.globalPosition,
      );
    },
    onDoubleTap: enableDoubleTapForUnit
        ? () {
            final options = PurchaseTableHelpers.unitOptions(prod, item.unit);
            if (options.length > 1) {
              final newUnit = options.firstWhere((u) => u != item.unit,
                  orElse: () => item.unit);
              final newCost = PurchaseTableHelpers.unitCost(prod, newUnit);
              final newPrice = PurchaseTableHelpers.unitPrice(prod, newUnit);
              onUpdate(
                index,
                item.copyWith(
                  unit: newUnit,
                  cost: newCost,
                  price: newPrice,
                  isManualPrice: false,
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("لا توجد وحدة أخرى للتحويل")),
              );
            }
          }
        : null,
    onTapDown: (_) {
      _TapCounter.registerTap(() async {
        await showDialog(
            context: context,
            builder: (_) => ProductDetailsDialog(item: item, product: prod));
      });
    },
    child: child,
  );
}

class _TapCounter {
  static int _count = 0;
  static DateTime _lastTap = DateTime.now();

  static void registerTap(Function onTripleTap) {
    final now = DateTime.now();
    if (now.difference(_lastTap).inMilliseconds > 600) {
      _count = 0;
    }
    _count++;
    _lastTap = now;
    if (_count == 3) {
      _count = 0;
      onTripleTap();
    }
  }
}
