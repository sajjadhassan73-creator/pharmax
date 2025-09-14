import 'package:drift/drift.dart';

@DataClassName('SupplierData')
class Suppliers extends Table {

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();             // اسم المورد
  TextColumn get phone => text().nullable()(); // رقم الهاتف (اختياري)
  TextColumn get email => text().nullable()(); // البريد الإلكتروني
  TextColumn get address => text().nullable()(); // العنوان
  TextColumn get notes => text().nullable()();   // ملاحظات عامة
}
