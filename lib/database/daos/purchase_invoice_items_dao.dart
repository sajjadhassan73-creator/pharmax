import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/purchase_invoice_items.dart';
import '../../models/purchase_invoice_item_model.dart';

part 'purchase_invoice_items_dao.g.dart';

@DriftAccessor(tables: [PurchaseInvoiceItems])
class PurchaseInvoiceItemsDao extends DatabaseAccessor<AppDatabase>
    with _$PurchaseInvoiceItemsDaoMixin {
  PurchaseInvoiceItemsDao(super.db);

  /// ✅ إدخال عناصر فاتورة كاملة
  Future<void> insertItems(
      List<PurchaseInvoiceItemModel> items, int invoiceId) async {
    for (final item in items) {
      await into(purchaseInvoiceItems).insert(
        PurchaseInvoiceItemsCompanion(
          invoiceId: Value(invoiceId),
          productId: Value(item.productId),
          name: Value(item.name),
          unit: Value(item.unit),
          expiry: Value(item.expiry),
          quantity: Value(item.quantity),
          cost: Value(item.cost),
          bonus: Value(item.bonus),
          costAfterBonus: Value(item.costAfterBonus),
          profitPercent: Value(item.profitPercent),
          price: Value(item.price),
          price2: Value(item.price2), // 🆕 إضافة السعر 2
        ),
      );
    }
  }

  /// ✅ جلب كل العناصر لرقم فاتورة
  Future<List<PurchaseInvoiceItemModel>> getItemsForInvoice(
      int invoiceId) async {
    final rows = await (select(purchaseInvoiceItems)
          ..where((tbl) => tbl.invoiceId.equals(invoiceId)))
        .get();

    return rows.map((row) => PurchaseInvoiceItemModel.fromDrift(row)).toList();
  }

  /// 🟢 Alias حتى يشتغل الكود القديم بدون تعديل
  Future<List<PurchaseInvoiceItemModel>> getItemsByInvoiceId(
      int invoiceId) async {
    return getItemsForInvoice(invoiceId);
  }

  /// ✅ حذف كل العناصر لفاتورة معينة
  Future<void> deleteItemsByInvoiceId(int invoiceId) async {
    await (delete(purchaseInvoiceItems)
          ..where((tbl) => tbl.invoiceId.equals(invoiceId)))
        .go();
  }

  /// ✅ آخر سعر شراء لمنتج
  Future<PurchaseInvoiceItemModel?> getLastPurchasePrice(int productId) async {
    final row = await (select(purchaseInvoiceItems)
          ..where((tbl) => tbl.productId.equals(productId))
          ..orderBy([(t) => OrderingTerm.desc(t.id)])
          ..limit(1))
        .getSingleOrNull();

    return row != null ? PurchaseInvoiceItemModel.fromDrift(row) : null;
  }

  /// ✅ أرخص سعر شراء لمنتج
  Future<PurchaseInvoiceItemModel?> getCheapestPurchasePrice(
      int productId) async {
    final row = await (select(purchaseInvoiceItems)
          ..where((tbl) => tbl.productId.equals(productId))
          ..orderBy([(t) => OrderingTerm.asc(t.cost)])
          ..limit(1))
        .getSingleOrNull();

    return row != null ? PurchaseInvoiceItemModel.fromDrift(row) : null;
  }
}
