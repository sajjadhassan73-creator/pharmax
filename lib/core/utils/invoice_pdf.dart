import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import '../../models/purchase_item.dart';
import '../../models/supplier_model.dart';

class InvoicePdf {
  static Future<void> generateInvoicePdf({
    required SupplierModel supplier,
    required String invoiceCode,
    required DateTime date,
    required List<PurchaseItem> items,
    required double totalCost,
    required double discount,
    required String discountType,
    required double finalTotal,
    required String notes,
    required String userName,
  }) async {
    // 🟢 1) نتحقق: إذا القائمة فارغة نرجع رسالة وما نطبع
    if (items.isEmpty) {
      print("⚠️ ماكو منتجات بالفاتورة، ما نكدر نطبع PDF");
      return;
    }

    final pdf = pw.Document();

    // 🟢 2) تحميل اللوغو إذا موجود
    pw.MemoryImage? logoImage;
    try {
      final logoData = await rootBundle.load('assets/logo.png');
      logoImage = pw.MemoryImage(logoData.buffer.asUint8List());
    } catch (e) {
      print("⚠️ اللوغو ما موجود بالـ assets/logo.png → راح نكمل بدون صورة");
    }

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          // 🟢 رأس الصفحة
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                "صيدلية سجاد حسن",
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              if (logoImage != null) pw.Image(logoImage, width: 80, height: 80),
            ],
          ),
          pw.Divider(),

          // 🟢 تفاصيل الفاتورة
          pw.SizedBox(height: 10),
          pw.TableHelper.fromTextArray(
            data: [
              ["المورد", supplier.name],
              ["رقم الفاتورة", invoiceCode],
              ["التاريخ", date.toString().split(" ").first],
            ],
            cellStyle: const pw.TextStyle(fontSize: 12),
            headerStyle: pw.TextStyle(
              fontSize: 12,
              fontWeight: pw.FontWeight.bold,
            ),
            headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
            cellAlignment: pw.Alignment.centerRight,
            columnWidths: {
              0: const pw.FlexColumnWidth(2),
              1: const pw.FlexColumnWidth(4),
            },
          ),

          pw.SizedBox(height: 20),

          // 🟢 جدول المنتجات
          pw.TableHelper.fromTextArray(
            headers: ["الاسم", "الكمية", "الكلفة", "البونص", "الربح%", "السعر"],
            data: items.map((item) {
              return [
                item.name,
                item.quantity.toString(),
                item.cost.toStringAsFixed(2),
                item.bonus.toString(),
                item.profitPercentage.toStringAsFixed(1),
                item.price.toStringAsFixed(2),
              ];
            }).toList(),
            headerStyle: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              fontSize: 12,
            ),
            cellStyle: const pw.TextStyle(fontSize: 11),
            headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
            cellAlignment: pw.Alignment.center,
          ),

          pw.SizedBox(height: 20),

          // 🟢 المجموع والخصم
          pw.Align(
            alignment: pw.Alignment.centerRight,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text("المجموع: ${totalCost.toStringAsFixed(2)}"),
                pw.Text(
                    "الخصم: ${discount.toStringAsFixed(2)} ($discountType)"),
                pw.Text(
                  "الإجمالي النهائي: ${finalTotal.toStringAsFixed(2)}",
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          pw.SizedBox(height: 20),

          // 🟢 الملاحظات
          if (notes.isNotEmpty)
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.all(8),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.grey),
              ),
              child: pw.Text(
                "ملاحظات: $notes",
                style: const pw.TextStyle(fontSize: 12),
              ),
            ),

          pw.SizedBox(height: 40),

          // 🟢 التوقيع / المستخدم
          pw.Align(
            alignment: pw.Alignment.centerRight,
            child: pw.Text("المستخدم: $userName"),
          ),
        ],
      ),
    );

    // 🟢 3) طباعة PDF
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
