import 'package:flutter/material.dart';

class InventoryDialog extends StatefulWidget {
  const InventoryDialog({super.key});

  @override
  State<InventoryDialog> createState() => _InventoryDialogState();
}

class _InventoryDialogState extends State<InventoryDialog> {
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool hasSecondaryUnit = true; // نفرض مؤقتًا أن المنتج يحتوي وحدة ثانوية
  String primaryUnit = "باكيت";
  String secondaryUnit = "شريط";

  // رصيد حالي وهمي (يتحدث لاحقًا من قاعدة البيانات)
  int currentPrimaryQty = 2;
  int currentSecondaryQty = 1;

  List<BatchRow> batches = [
    BatchRow(),
  ];

  void addBatchRow() {
    setState(() {
      batches.add(BatchRow());
    });
  }

  void removeBatchRow(int index) {
    setState(() {
      batches.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("جرد المنتج"),
      content: SizedBox(
        width: 600,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔍 البحث عن المنتج
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: barcodeController,
                      decoration: const InputDecoration(labelText: "رمز المنتج"),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: "الاسم التجاري"),
                    ),
                  ),
                ],
              ),
              const Divider(),

              // 📊 الرصيد الحالي
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  hasSecondaryUnit
                      ? 'الرصيد الحالي: $currentPrimaryQty $primaryUnit و $currentSecondaryQty $secondaryUnit'
                      : 'الرصيد الحالي: $currentPrimaryQty $primaryUnit',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),

              // 📥 الرصيد الجديد عبر وجبات
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "الرصيد الجديد (قسّم الوجبات حسب تاريخ النفاذ):",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),

              ...batches.asMap().entries.map((entry) {
                int index = entry.key;
                BatchRow batch = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: batch.expiryController,
                          decoration: const InputDecoration(
                            labelText: "تاريخ النفاذ (YYYY-MM-DD)",
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: batch.costController,
                          decoration: const InputDecoration(labelText: "الكلفة"),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: batch.priceController,
                          decoration: const InputDecoration(labelText: "السعر"),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: batch.qtyController,
                          decoration: InputDecoration(
                            labelText: "الكمية (${hasSecondaryUnit ? secondaryUnit : primaryUnit})",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => removeBatchRow(index),
                      ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: addBatchRow,
                  icon: const Icon(Icons.add),
                  label: const Text("إضافة وجبة أخرى"),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("إلغاء")),
        ElevatedButton(
          onPressed: () {
            // TODO: تنفيذ الحفظ وقاعدة البيانات
          },
          child: const Text("حفظ الجرد"),
        ),
      ],
    );
  }
}

// 👇 صف وجبة واحدة
class BatchRow {
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
}
