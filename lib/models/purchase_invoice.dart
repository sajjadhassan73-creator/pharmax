import 'package:pharmax/database/app_database.dart'; // ✅ هذا أهم سطر
// هذا السطر يستورد الكلاس PurchaseInvoicesData اللي تولده drift

class PurchaseInvoiceModel {
  final int? id;
  final int supplierId;
  final String invoiceCode;
  final DateTime date;
  final double totalCost;
  final double totalPrice;
  final String paymentType;
  final double discount;
  final String discountType;
  final String? notes;

  PurchaseInvoiceModel({
    this.id,
    required this.supplierId,
    required this.invoiceCode,
    required this.date,
    required this.totalCost,
    required this.totalPrice,
    required this.paymentType,
    required this.discount,
    required this.discountType,
    this.notes,
  });

  /// تحويل من سطر قاعدة بيانات إلى موديل
  factory PurchaseInvoiceModel.fromDrift(PurchaseInvoice row) {
    return PurchaseInvoiceModel(
      id: row.id,
      supplierId: row.supplierId,
      invoiceCode: row.invoiceCode,
      date: row.date,
      totalCost: row.totalCost,
      totalPrice: row.totalPrice,
      paymentType: row.paymentType,
      discount: row.discount,
      discountType: row.discountType,
      notes: row.notes,
    );
  }
}
