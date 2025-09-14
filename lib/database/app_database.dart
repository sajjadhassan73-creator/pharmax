import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/products.dart';
import 'tables/product_barcodes.dart';
import 'tables/suppliers.dart';
import 'tables/customers.dart';
import 'tables/purchase_invoice_items.dart'; // ✅ إضافة جدول الأصناف
import 'tables/purchase_invoices.dart'; // ✅ إذا كنت تستخدم جدول الفواتير أيضاً

import 'daos/products_dao.dart';
import 'daos/suppliers_dao.dart';
import 'daos/customers_dao.dart';
import 'daos/purchase_invoice_items_dao.dart'; // ✅ DAO الأصناف
import 'daos/purchase_invoices_dao.dart'; // ✅ DAO الفواتير

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Products,
    ProductBarcodes,
    Suppliers,
    Customers,
    PurchaseInvoiceItems, // ✅ جدول أصناف فواتير المشتريات
    PurchaseInvoices // ✅ جدول فواتير الشراء (إذا استخدمته)
  ],
  daos: [
    ProductsDao,
    SuppliersDao,
    CustomersDao,
    PurchaseInvoiceItemsDao,
    PurchaseInvoicesDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          // امثلة ترقية مستقبلية
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'pharmax.sqlite'));

    const isDevelopment = true;
    if (isDevelopment && await file.exists()) {
      await file.delete();
      print('🧹 قاعدة البيانات انحذفت (تطوير)');
    }

    return NativeDatabase(file);
  });
}
