// ✅ تعديل جدول Customers لإضافة حقل "التاريخ المرضي"
// 📁 الملف: lib/database/tables/customers.dart

import 'package:drift/drift.dart';

class Customers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get medicalHistory => text().nullable()(); // ✅ الحقل الجديد
}
