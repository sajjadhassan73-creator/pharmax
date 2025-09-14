import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/purchase_invoices.dart';
import '../../models/purchase_invoice.dart';

part 'purchase_invoices_dao.g.dart';

@DriftAccessor(tables: [PurchaseInvoices])
class PurchaseInvoicesDao extends DatabaseAccessor<AppDatabase>
    with _$PurchaseInvoicesDaoMixin {
  PurchaseInvoicesDao(super.db);

  /// ✅ إدخال فاتورة جديدة
  Future<int> insertInvoice(PurchaseInvoiceModel model) {
    return into(purchaseInvoices).insert(
      PurchaseInvoicesCompanion.insert(
        supplierId: model.supplierId,
        invoiceCode: model.invoiceCode,
        date: model.date,
        totalCost: model.totalCost,
        totalPrice: model.totalPrice,
        paymentType: model.paymentType,
        discount: Value(model.discount),
        discountType: Value(model.discountType),
        notes: Value(model.notes ?? ''),
      ),
    );
  }

  /// ✅ جلب كل الفواتير
  Future<List<PurchaseInvoiceModel>> getAllInvoices() async {
    final rows = await select(purchaseInvoices).get();
    return rows.map((row) => PurchaseInvoiceModel.fromDrift(row)).toList();
  }

  /// ✅ جلب فاتورة واحدة حسب ID
  Future<PurchaseInvoiceModel?> getInvoiceById(int id) async {
    final row = await (select(purchaseInvoices)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
    return row != null ? PurchaseInvoiceModel.fromDrift(row) : null;
  }

  /// ✅ تعديل فاتورة
  Future<bool> updateInvoice(PurchaseInvoiceModel invoice) async {
    if (invoice.id == null) return false;

    final updatedCount = await (update(purchaseInvoices)
          ..where((tbl) => tbl.id.equals(invoice.id!)))
        .write(
      PurchaseInvoicesCompanion(
        supplierId: Value(invoice.supplierId),
        invoiceCode: Value(invoice.invoiceCode),
        date: Value(invoice.date),
        totalCost: Value(invoice.totalCost),
        totalPrice: Value(invoice.totalPrice),
        paymentType: Value(invoice.paymentType),
        discount: Value(invoice.discount),
        discountType: Value(invoice.discountType),
        notes: Value(invoice.notes ?? ""),
      ),
    );

    return updatedCount > 0;
  }

  /// ✅ حذف فاتورة
  Future<void> deleteInvoice(int id) async {
    await (delete(purchaseInvoices)..where((tbl) => tbl.id.equals(id))).go();
  }

  /// ✅ جلب آخر فاتورة
  Future<PurchaseInvoiceModel?> getLastInvoice() async {
    final row = await (select(purchaseInvoices)
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.id)])
          ..limit(1))
        .getSingleOrNull();
    return row != null ? PurchaseInvoiceModel.fromDrift(row) : null;
  }

  /// ✅ جلب فواتير مورد معين
  Future<List<PurchaseInvoiceModel>> getInvoicesBySupplier(
      int supplierId) async {
    final rows = await (select(purchaseInvoices)
          ..where((tbl) => tbl.supplierId.equals(supplierId)))
        .get();
    return rows.map((row) => PurchaseInvoiceModel.fromDrift(row)).toList();
  }

  /// ✅ توليد رقم الفاتورة القادم بصيغة INV-<num>
  Future<String> getNextInvoiceCode() async {
    final last = await (select(purchaseInvoices)
          ..orderBy([(t) => OrderingTerm.desc(t.id)])
          ..limit(1))
        .getSingleOrNull();

    if (last == null) return 'INV-1';

    final lastNum = int.tryParse(last.invoiceCode.replaceAll('INV-', '')) ?? 0;
    return 'INV-${lastNum + 1}';
  }
}
