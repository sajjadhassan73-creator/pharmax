// lib/screens/purchases/widgets/product_details_dialog.dart
import 'package:flutter/material.dart';
import '../../../models/purchase_item.dart';
import '../../../models/product_model.dart';

class ProductDetailsDialog extends StatelessWidget {
  final PurchaseItem item;
  final ProductModel? product;

  const ProductDetailsDialog({
    super.key,
    required this.item,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    final costAfterBonus = _calcCostAfterBonus(item);

    // 🟢 معلومات الوحدة الأخرى
    String otherUnit = "-";
    String packing = "-";
    String otherCost = "-";
    String otherPrice = "-";

    if (product != null && product!.packing > 1) {
      final secondaryName = (product!.secondaryUnitName != null &&
              product!.secondaryUnitName!.trim().isNotEmpty)
          ? product!.secondaryUnitName!
          : "الوحدة الثانوية";

      if (item.unit == product!.unit) {
        // ✅ الفاتورة بالوحدة الأساسية → نولد الثانوية
        otherUnit = secondaryName;
        packing = product!.packing.toString();
        final secCost = costAfterBonus / product!.packing;
        final secPrice = item.price / product!.packing;
        otherCost = secCost.toStringAsFixed(2);
        otherPrice = secPrice.toStringAsFixed(2);
      } else if (item.unit == secondaryName) {
        // ✅ الفاتورة بالوحدة الثانوية → نولد الأساسية
        otherUnit = product!.unit;
        packing = product!.packing.toString();
        final primCost = costAfterBonus * product!.packing;
        final primPrice = item.price * product!.packing;
        otherCost = primCost.toStringAsFixed(2);
        otherPrice = primPrice.toStringAsFixed(2);
      }
    }

    return AlertDialog(
      title: const Text("📄 تفاصيل المنتج"),
      content: SingleChildScrollView(
        child: Table(
          columnWidths: const {0: IntrinsicColumnWidth(), 1: FlexColumnWidth()},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            _buildRow("الرمز", item.productId.toString()),
            _buildRow("الاسم التجاري", item.name),
            _buildRow("الاسم العلمي", item.scientific ?? "-"),
            _buildRow("الشركة", item.company ?? "-"),
            _buildRow("الوحدة", item.unit),
            _buildRow("الكمية", item.quantity.toString()),
            _buildRow("البونص", item.bonus.toString()),
            _buildRow("تاريخ النفاذ",
                item.expiry?.toIso8601String().split('T').first ?? "-"),
            _buildRow("الكلفة", item.cost.toStringAsFixed(2)),
            _buildRow("الكلفة بعد البونص", costAfterBonus.toStringAsFixed(2)),
            _buildRow("نسبة الربح", "${item.profitPercentage}%"),
            _buildRow("سعر البيع", item.price.toStringAsFixed(2)),
            _buildRow("مجموع الكلفة",
                (costAfterBonus * item.quantity).toStringAsFixed(2)),
            _buildRow(
                "مجموع السعر", (item.price * item.quantity).toStringAsFixed(2)),
            const TableRow(
                children: [SizedBox(height: 12), SizedBox(height: 12)]),
            _buildRow("⚡ الوحدة الأخرى", otherUnit),
            _buildRow("التعبئة", packing),
            _buildRow("الكلفة للوحدة الأخرى", otherCost),
            _buildRow("السعر للوحدة الأخرى", otherPrice),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("إغلاق"),
        ),
      ],
    );
  }

  TableRow _buildRow(String label, String value) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(value),
      ),
    ]);
  }

  double _calcCostAfterBonus(PurchaseItem it) {
    final totalUnits = it.quantity + it.bonus;
    if (totalUnits <= 0) return 0;
    return (it.cost * it.quantity) / totalUnits;
  }
}
