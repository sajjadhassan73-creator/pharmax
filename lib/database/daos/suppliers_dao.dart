import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/suppliers.dart';

part 'suppliers_dao.g.dart';

@DriftAccessor(tables: [Suppliers])
class SuppliersDao extends DatabaseAccessor<AppDatabase>
    with _$SuppliersDaoMixin {
  SuppliersDao(super.db);

  Future<int> insertSupplier(SuppliersCompanion supplier) {
    return into(suppliers).insert(supplier);
  }

  Future<bool> updateSupplier(SuppliersCompanion supplier) {
    return update(suppliers).replace(supplier);
  }

  Future<int> deleteSupplier(int id) {
    return (delete(suppliers)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<SupplierData>> getAllSuppliers() {
    return select(suppliers).get();
  }

  Future<List<SupplierData>> searchSuppliersByName(String query) {
    return (select(suppliers)..where((tbl) => tbl.name.like('%$query%'))).get();
  }

  Future<SupplierData?> getSupplierById(int id) {
    return (select(suppliers)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }
}
