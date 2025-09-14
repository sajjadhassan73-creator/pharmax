import 'package:drift/drift.dart';
import 'products.dart';

class ProductBarcodes extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get productId => integer().references(Products, #id)();

  TextColumn get barcode => text()(); // ممكن يكون باركود أو رمز داخلي
}
