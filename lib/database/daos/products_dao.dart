// 📁 lib/database/daos/products_dao.dart
import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/products.dart';
import '../tables/product_barcodes.dart';

part 'products_dao.g.dart';

@DriftAccessor(tables: [Products, ProductBarcodes])
class ProductsDao extends DatabaseAccessor<AppDatabase>
    with _$ProductsDaoMixin {
  ProductsDao(super.db);

  Future<int> insertProduct(
      ProductsCompanion entry, List<String> barcodes) async {
    return transaction(() async {
      final id = await into(products).insert(entry);
      for (final code in barcodes) {
        await into(productBarcodes).insert(
          ProductBarcodesCompanion.insert(productId: id, barcode: code),
        );
      }
      return id;
    });
  }

  Future<List<ProductWithBarcodes>> getAllProducts() async {
    final rows = await select(products).get();
    return Future.wait(rows.map((product) async {
      final codes = await (select(productBarcodes)
            ..where((b) => b.productId.equals(product.id)))
          .get();
      return ProductWithBarcodes(product, codes.map((e) => e.barcode).toList());
    }));
  }

  Future<ProductWithBarcodes?> getProductByBarcode(String code) async {
    final joined = await (select(products).join([
      innerJoin(
          productBarcodes, productBarcodes.productId.equalsExp(products.id))
    ])
          ..where(productBarcodes.barcode.equals(code)))
        .getSingleOrNull();

    if (joined == null) return null;

    final product = joined.readTable(products);
    final barcodesList = await (select(productBarcodes)
          ..where((b) => b.productId.equals(product.id)))
        .get();

    return ProductWithBarcodes(
        product, barcodesList.map((b) => b.barcode).toList());
  }

  Future<bool> updateProduct(
      int id, ProductsCompanion updated, List<String> newBarcodes) async {
    return transaction(() async {
      final count = await (update(products)..where((tbl) => tbl.id.equals(id)))
          .write(updated);

      await (delete(productBarcodes)..where((b) => b.productId.equals(id)))
          .go();

      for (final code in newBarcodes) {
        await into(productBarcodes).insert(
          ProductBarcodesCompanion.insert(productId: id, barcode: code),
        );
      }
      return count > 0;
    });
  }

  Future<bool> deleteProduct(int id) async {
    return transaction(() async {
      await (delete(productBarcodes)..where((b) => b.productId.equals(id)))
          .go();
      final count =
          await (delete(products)..where((tbl) => tbl.id.equals(id))).go();
      return count > 0;
    });
  }

  // ✅ تحقق من وجود باركود (مع استثناء منتج محدد عند التعديل)
  Future<bool> isBarcodeExists(String barcode, {int? excludeId}) async {
    if (barcode.isEmpty) return false;

    // تحقق من الباركود الأساسي
    final mainQuery =
        select(products)..where((tbl) => tbl.mainBarcode.equals(barcode));
    if (excludeId != null) {
      mainQuery.where((tbl) => tbl.id.isNotValue(excludeId));
    }
    final mainResult = await mainQuery.get();
    if (mainResult.isNotEmpty) return true;

    // تحقق من جدول الباركودات الثانوية
    final extraQuery =
        select(productBarcodes)..where((tbl) => tbl.barcode.equals(barcode));
    if (excludeId != null) {
      extraQuery.where((tbl) => tbl.productId.isNotValue(excludeId));
    }
    final extraResult = await extraQuery.get();

    return extraResult.isNotEmpty;
  }

  // ✅ تحقق من وجود الاسم التجاري (مع استثناء منتج محدد عند التعديل)
  Future<bool> isNameExists(String name, {int? excludeId}) async {
    if (name.isEmpty) return false;

    final query = select(products)..where((tbl) => tbl.name.equals(name));
    if (excludeId != null) {
      query.where((tbl) => tbl.id.isNotValue(excludeId));
    }
    final result = await query.get();

    return result.isNotEmpty;
  }
}

class ProductWithBarcodes {
  final ProductData product;
  final List<String> barcodes;

  ProductWithBarcodes(this.product, this.barcodes);
}
