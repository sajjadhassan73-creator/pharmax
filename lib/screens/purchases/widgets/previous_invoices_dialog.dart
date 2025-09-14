import 'package:flutter/material.dart';
import '../../../database/app_database.dart';
import '../../../models/purchase_invoice.dart';
import '../../../logic/purchases_logic.dart';

class PreviousInvoicesDialog extends StatelessWidget {
  final List<PurchaseInvoiceModel> invoices;
  final PurchasesLogic logic;
  final AppDatabase db;
  final void Function(PurchaseInvoiceModel)? onInvoiceSelected; // 🟢 جديد

  const PreviousInvoicesDialog({
    super.key,
    required this.invoices,
    required this.logic,
    required this.db,
    this.onInvoiceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      child: Container(
        width: 500,
        height: 500,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "القوائم السابقة",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Expanded(
              child: invoices.isEmpty
                  ? const Center(child: Text("لا توجد فواتير سابقة"))
                  : ListView.builder(
                      itemCount: invoices.length,
                      itemBuilder: (context, index) {
                        final inv = invoices[index];
                        return Card(
                          elevation: 1,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            leading: const Icon(Icons.receipt_long),
                            title: Text("فاتورة: ${inv.invoiceCode}"),
                            subtitle: Text(
                              "التاريخ: ${inv.date.toString().split(' ').first} | المجموع: ${inv.totalCost.toStringAsFixed(2)}",
                            ),
                            onTap: () async {
                              // 🟢 تحميل الفاتورة مع المنتجات
                              await logic.loadInvoice(
                                db: db,
                                invoiceId: inv.id!,
                              );

                              // 🟢 إعلام الشاشة الرئيسية أن تم اختيار فاتورة
                              onInvoiceSelected?.call(inv);

                              if (context.mounted) {
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "تم تحميل الفاتورة رقم ${inv.invoiceCode} ✅"),
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
            ),
            const Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("إغلاق"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
