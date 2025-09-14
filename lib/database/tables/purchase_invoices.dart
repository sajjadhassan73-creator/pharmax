import 'package:drift/drift.dart';

class PurchaseInvoices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get supplierId => integer()();
  TextColumn get invoiceCode => text()();
  DateTimeColumn get date => dateTime()();
  RealColumn get totalCost => real()();
  RealColumn get totalPrice => real()();
  TextColumn get paymentType => text()(); // "نقدي" أو "آجل"
  RealColumn get discount => real().withDefault(const Constant(0.0))();
  TextColumn get discountType =>
      text().withDefault(const Constant("مبلغ"))(); // "مبلغ" أو "نسبة"
  TextColumn get notes => text().withDefault(const Constant(""))();
}
