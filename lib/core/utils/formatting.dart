import 'package:intl/intl.dart';

class Formatter {
  static String currency(num value) {
    final formatter = NumberFormat.currency(locale: 'ar', symbol: 'د.ع', decimalDigits: 0);
    return formatter.format(value);
  }

  static String date(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String percentage(double value) {
    return '${value.toStringAsFixed(2)}%';
  }
}
