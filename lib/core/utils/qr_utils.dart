// lib/core/utils/qr_utils.dart
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class QrUtils {
  /// 🖨️ طباعة QR لوجبة المنتج
  static Future<void> printBatchQr({
    required int productId,
    required String name,
    required double cost,
    required double price,
    required DateTime expiry,
    required DateTime createdAt,
  }) async {
    final pdf = pw.Document();

    final qrData = '''
ID: $productId
اسم: $name
الكلفة: $cost
السعر: $price
تاريخ النفاذ: ${expiry.toIso8601String().split('T').first}
تاريخ الإدخال: ${createdAt.toIso8601String().split('T').first}
''';

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a6,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text("منتج: $name",
                  style: pw.TextStyle(
                      fontSize: 14, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 8),
              pw.BarcodeWidget(
                barcode: pw.Barcode.qrCode(),
                data: qrData,
                width: 150,
                height: 150,
              ),
              pw.SizedBox(height: 8),
              pw.Text("الكلفة: $cost"),
              pw.Text("السعر: $price"),
              pw.Text("النفاذ: ${expiry.toIso8601String().split('T').first}"),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
