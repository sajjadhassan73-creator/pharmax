// lib/models/purchase_item.dart

import 'purchase_invoice_item_model.dart';

class PurchaseItem {
  final int productId;
  final String name; // الاسم التجاري
  final String? scientific; // الاسم العلمي
  final String? company; // الشركة
  final String unit; // الوحدة
  final DateTime? expiry; // تاريخ النفاذ
  final int quantity; // الكمية
  final double cost; // الكلفة
  final int bonus; // البونص
  final double profitPercentage; // نسبة الربح
  final double price; // السعر 1 (الوحدة الأساسية)
  final double? price2; // السعر 2 (الوحدة الثانوية، قد يكون null)
  final bool isManualPrice; // ✅ هل السعر مدخل يدوياً؟

  PurchaseItem({
    required this.productId,
    required this.name,
    this.scientific,
    this.company,
    required this.unit,
    this.expiry,
    required this.quantity,
    required this.cost,
    required this.bonus,
    required this.profitPercentage,
    required this.price,
    this.price2,
    this.isManualPrice = false,
  });

  /// 🟢 نسخة جديدة مع تعديلات
  PurchaseItem copyWith({
    int? productId,
    String? name,
    String? scientific,
    String? company,
    String? unit,
    DateTime? expiry,
    int? quantity,
    double? cost,
    int? bonus,
    double? profitPercentage,
    double? price,
    double? price2,
    bool? isManualPrice,
  }) {
    return PurchaseItem(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      scientific: scientific ?? this.scientific,
      company: company ?? this.company,
      unit: unit ?? this.unit,
      expiry: expiry ?? this.expiry,
      quantity: quantity ?? this.quantity,
      cost: cost ?? this.cost,
      bonus: bonus ?? this.bonus,
      profitPercentage: profitPercentage ?? this.profitPercentage,
      price: price ?? this.price,
      price2: price2 ?? this.price2,
      isManualPrice: isManualPrice ?? this.isManualPrice,
    );
  }

  /// 🟢 تحويل من PurchaseInvoiceItemModel
  factory PurchaseItem.fromInvoiceItem(PurchaseInvoiceItemModel model) {
    return PurchaseItem(
      productId: model.productId,
      name: model.name,
      unit: model.unit,
      expiry: model.expiry,
      quantity: model.quantity,
      cost: model.cost,
      bonus: model.bonus,
      profitPercentage: model.profitPercent,
      price: model.price,
      price2: model.price2,
    );
  }

  // -------- Getters للعرض الصحيح -------- //

  /// 🔵 الكلفة كعدد صحيح
  int get costInt => cost.round();

  /// 🔵 نسبة الربح كعدد صحيح
  int get profitInt => profitPercentage.round();

  /// 🔵 السعر 1 كعدد صحيح
  int get priceInt => price.round();

  /// 🔵 السعر 2 كعدد صحيح (أو null)
  int? get price2Int => price2?.round();
}
