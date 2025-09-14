import 'package:flutter/material.dart';
import '../../../logic/purchases_logic.dart';
import '../../../database/app_database.dart';
import '../../../models/purchase_item.dart';

class PurchasesBottomSection extends StatelessWidget {
  final PurchasesLogic logic;
  final AppDatabase db;

  final VoidCallback onShowPreviousInvoices;
  final VoidCallback onClearOrDelete;
  final VoidCallback onShowDiscount;
  final VoidCallback onSaveInvoice;
  final VoidCallback onPrintInvoice;
  final VoidCallback onNewInvoice;
  final bool isEditing;

  final TextEditingController notesController;
  final TextEditingController discountController;
  final String discountType;

  const PurchasesBottomSection({
    super.key,
    required this.logic,
    required this.db,
    required this.onShowPreviousInvoices,
    required this.onClearOrDelete,
    required this.onShowDiscount,
    required this.onSaveInvoice,
    required this.onPrintInvoice,
    required this.onNewInvoice,
    required this.isEditing,
    required this.notesController,
    required this.discountController,
    required this.discountType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🟢 عرض المجموع
          ValueListenableBuilder<List<PurchaseItem>>(
            valueListenable: logic.itemsNotifier,
            builder: (context, items, _) {
              final totalCost = logic.totalCost;
              final discount = double.tryParse(discountController.text) ?? 0;
              final finalTotal = logic.finalTotal;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("المجموع: ${totalCost.toStringAsFixed(2)}"),
                  Text("الخصم: ${discount.toStringAsFixed(2)} ($discountType)"),
                  Text(
                    "الإجمالي النهائي: ${finalTotal.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 8),

          // 🟢 ملاحظات
          TextField(
            controller: notesController,
            maxLines: 2,
            decoration: InputDecoration(
              hintText: "إضافة ملاحظة...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
          ),

          const SizedBox(height: 8),

          // 🟢 الأزرار
          Row(
            children: [
              ElevatedButton(
                onPressed: onShowPreviousInvoices,
                child: const Text("القوائم السابقة"),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: onClearOrDelete,
                child: Text(isEditing ? "حذف" : "إلغاء"),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: onShowDiscount,
                icon: const Icon(Icons.percent),
                label: const Text("خصم"),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: onSaveInvoice,
                icon: Icon(isEditing ? Icons.edit : Icons.save),
                label: Text(isEditing ? "تعديل" : "حفظ"),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: onPrintInvoice,
                icon: const Icon(Icons.print),
                label: const Text("طباعة"),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: onNewInvoice,
                icon: const Icon(Icons.add),
                label: const Text("جديد"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
