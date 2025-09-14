import 'package:flutter/material.dart';
import '../../../logic/purchases_logic.dart';

class DiscountDialog extends StatefulWidget {
  final PurchasesLogic logic;
  final TextEditingController discountController;
  final String currentType;
  final Function(String type, double value) onApplied;

  const DiscountDialog({
    super.key,
    required this.logic,
    required this.discountController,
    required this.currentType,
    required this.onApplied,
  });

  @override
  State<DiscountDialog> createState() => _DiscountDialogState();
}

class _DiscountDialogState extends State<DiscountDialog> {
  late TextEditingController _controller;
  late String _type;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.discountController.text);
    _type = widget.currentType;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("إضافة خصم"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "قيمة الخصم"),
          ),
          const SizedBox(height: 10),
          DropdownButton<String>(
            value: _type,
            items: const [
              DropdownMenuItem(value: "مبلغ", child: Text("مبلغ")),
              DropdownMenuItem(value: "نسبة", child: Text("نسبة")),
            ],
            onChanged: (val) {
              if (val != null) {
                setState(() => _type = val);
              }
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("إلغاء"),
        ),
        ElevatedButton(
          onPressed: () {
            final value = double.tryParse(_controller.text) ?? 0;
            widget.logic.applyDiscount(_type, value);
            widget.discountController.text = value.toString();
            widget.onApplied(_type, value);
            Navigator.pop(context);
          },
          child: const Text("تطبيق"),
        ),
      ],
    );
  }
}
