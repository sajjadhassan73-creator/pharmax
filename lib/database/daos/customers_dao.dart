import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/customers.dart';
import '../../models/customer_model.dart';

part 'customers_dao.g.dart';

@DriftAccessor(tables: [Customers])
class CustomersDao extends DatabaseAccessor<AppDatabase>
    with _$CustomersDaoMixin {
  CustomersDao(super.db);

  // ✅ استرجاع جميع الزبائن وتحويلهم إلى CustomerModel
  Future<List<CustomerModel>> getAllCustomers() async {
    final query = await select(customers).get();
    return query
        .map((row) => CustomerModel(
              id: row.id,
              name: row.name,
              phone: row.phone,
              email: row.email,
              address: row.address,
              notes: row.notes,
              medicalHistory: row.medicalHistory,
            ))
        .toList();
  }

  // ✅ إدخال زبون جديد
  Future<int> insertCustomer(CustomerModel model) {
    return into(customers).insert(CustomersCompanion(
      name: Value(model.name),
      phone: Value(model.phone),
      email: Value(model.email),
      address: Value(model.address),
      notes: Value(model.notes),
      medicalHistory: Value(model.medicalHistory),
    ));
  }

  // ✅ تعديل زبون
  Future<bool> updateCustomer(int id, CustomerModel model) async {
    final updatedCount =
        await (update(customers)..where((tbl) => tbl.id.equals(id))).write(
      CustomersCompanion(
        name: Value(model.name),
        phone: Value(model.phone),
        email: Value(model.email),
        address: Value(model.address),
        notes: Value(model.notes),
        medicalHistory: Value(model.medicalHistory),
      ),
    );
    return updatedCount > 0;
  }

  // ✅ حذف زبون
  Future<int> deleteCustomer(int id) {
    return (delete(customers)..where((tbl) => tbl.id.equals(id))).go();
  }
}
