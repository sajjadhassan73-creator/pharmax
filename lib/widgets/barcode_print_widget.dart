import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart'; // هذا المهم!


class BarcodePrintWidget extends StatelessWidget {
  final String barcodeText;

  const BarcodePrintWidget({super.key, required this.barcodeText});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.print),
      tooltip: 'طباعة الرمز',
      onPressed: () async {
        if (barcodeText.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('الرمز فارغ، لا يمكن الطباعة')),
          );
          return;
        }

        final doc = pw.Document();
        doc.addPage(
          pw.Page(
            build: (pw.Context context) {
              return pw.Center(
                child: pw.BarcodeWidget(
                  barcode: pw.Barcode.code128(),
                  data: barcodeText,
                  width: 200,
                  height: 80,
                  drawText: true,
                ),
              );
            },
          ),
        );

        await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => doc.save(),
        );
      },
    );
  }
}
