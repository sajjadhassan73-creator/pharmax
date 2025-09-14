import 'package:drift/drift.dart';

class PurchaseInvoiceItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get invoiceId => integer()(); // مفتاح خارجي لفاتورة الشراء
  IntColumn get productId => integer()(); // مفتاح خارجي للمنتج
  TextColumn get name => text()(); // الاسم التجاري
  TextColumn get unit => text()(); // الوحدة
  DateTimeColumn get expiry =>
      dateTime().nullable()(); // ✅ تاريخ النفاذ كـ DateTime
  IntColumn get quantity => integer()(); // الكمية
  RealColumn get cost => real()(); // الكلفة الأصلية
  IntColumn get bonus => integer().withDefault(const Constant(0))(); // البونص
  RealColumn get costAfterBonus => real()(); // الكلفة بعد البونص
  RealColumn get profitPercent =>
      real().withDefault(const Constant(0))(); // نسبة الربح
  RealColumn get price => real()(); // السعر 1 (الوحدة الأساسية)
  RealColumn get price2 =>
      real().nullable()(); // 🆕 السعر 2 (الوحدة الثانوية إن وجدت)
}
