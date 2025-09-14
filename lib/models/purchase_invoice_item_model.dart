// lib/models/purchase_invoice_item_model.dart
import 'package:pharmax/database/app_database.dart'; // ✅ الاستيراد الصحيح

class PurchaseInvoiceItemModel {
  final int? id;
  final int invoiceId;
  final int productId;
  final String name;
  final String unit;
  final DateTime? expiry;
  final int quantity;
  final double cost;
  final int bonus;
  final double costAfterBonus;
  final double profitPercent;
  final double price; // السعر 1 (الوحدة الأساسية)
  final double? price2; // 🆕 السعر 2 (الوحدة الثانوية، قد يكون null)

  PurchaseInvoiceItemModel({
    this.id,
    required this.invoiceId,
    required this.productId,
    required this.name,
    required this.unit,
    this.expiry,
    required this.quantity,
    required this.cost,
    required this.bonus,
    required this.costAfterBonus,
    required this.profitPercent,
    required this.price,
    this.price2, // 🆕
  });

  /// ✅ من Data class (Drift) → Model
  factory PurchaseInvoiceItemModel.fromDrift(PurchaseInvoiceItem row) {
    return PurchaseInvoiceItemModel(
      id: row.id,
      invoiceId: row.invoiceId,
      productId: row.productId,
      name: row.name,
      unit: row.unit,
      expiry: row.expiry,
      quantity: row.quantity,
      cost: row.cost,
      bonus: row.bonus,
      costAfterBonus: row.costAfterBonus,
      profitPercent: row.profitPercent,
      price: row.price,
      price2: row.price2, // 🆕 لازم تضيف العمود للجدول في Drift
    );
  }

  /// ✅ إلى Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'invoiceId': invoiceId,
      'productId': productId,
      'name': name,
      'unit': unit,
      'expiry': expiry?.toIso8601String(),
      'quantity': quantity,
      'cost': cost,
      'bonus': bonus,
      'costAfterBonus': costAfterBonus,
      'profitPercent': profitPercent,
      'price': price,
      'price2': price2, // 🆕
    };
  }
}
