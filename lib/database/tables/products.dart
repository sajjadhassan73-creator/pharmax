import 'package:drift/drift.dart';

@DataClassName('ProductData') // 👈 هذا السطر هو المهم
class Products extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get mainBarcode => text().nullable()();

  TextColumn get name => text()(); // الاسم التجاري
  TextColumn get scientific => text().nullable()(); // الاسم العلمي
  TextColumn get company => text().nullable()(); // الشركة
  TextColumn get group => text().nullable()(); // المجموعة

  TextColumn get primaryUnit => text()(); // مثال: علبة أو باكيت
  RealColumn get primaryCost => real()(); // كلفة 1
  RealColumn get primaryPrice => real()(); // سعر 1

  TextColumn get secondaryUnit => text().nullable()(); // مثل شريط أو كبسولة
  IntColumn get packing =>
      integer().withDefault(const Constant(1))(); // التعبئة
  RealColumn get secondaryCost => real().nullable()(); // كلفة 2
  RealColumn get secondaryPrice => real().nullable()(); // سعر 2

  IntColumn get minStockAlert => integer().nullable()(); // تنبيه النقص
}
