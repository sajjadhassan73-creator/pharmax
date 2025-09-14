import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

import '../../database/app_database.dart';
import '../../database/daos/products_dao.dart';
import '../../models/product_model.dart';

class EditProductDialog extends StatefulWidget {
  final ProductModel product;
  final List<String> barcodes;

  const EditProductDialog({
    super.key,
    required this.product,
    required this.barcodes,
  });

  @override
  State<EditProductDialog> createState() => _EditProductDialogState();
}

class _EditProductDialogState extends State<EditProductDialog> {
  final _formKey = GlobalKey<FormState>();

  late List<TextEditingController> _barcodeControllers;
  late TextEditingController _nameController;
  late TextEditingController _scientificController;
  late TextEditingController _companyController;
  late TextEditingController _groupController;
  late TextEditingController _primaryCostController;
  late TextEditingController _primaryPriceController;
  late TextEditingController _unitController;
  late TextEditingController _secondaryUnitController;
  late TextEditingController _packingController;
  late TextEditingController _secondaryCostController;
  late TextEditingController _secondaryPriceController;

  bool showSecondary = false;
  late ProductsDao dao;

  @override
  void initState() {
    super.initState();
    _barcodeControllers = widget.barcodes
        .map((code) => TextEditingController(text: code))
        .toList();

    _nameController = TextEditingController(text: widget.product.name);
    _scientificController =
        TextEditingController(text: widget.product.scientific ?? '');
    _companyController =
        TextEditingController(text: widget.product.company ?? '');
    _groupController = TextEditingController(text: widget.product.group ?? '');
    _unitController = TextEditingController(text: widget.product.unit);
    _primaryCostController =
        TextEditingController(text: widget.product.primaryCost.toString());
    _primaryPriceController =
        TextEditingController(text: widget.product.primaryPrice.toString());

    _secondaryUnitController =
        TextEditingController(text: widget.product.secondaryUnitName ?? '');
    _packingController =
        TextEditingController(text: widget.product.packing.toString());
    _secondaryCostController = TextEditingController(
        text: widget.product.secondaryCost?.toString() ?? '');
    _secondaryPriceController = TextEditingController(
        text: widget.product.secondaryPrice?.toString() ?? '');

    showSecondary = widget.product.secondaryUnitName != null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final db = Provider.of<AppDatabase>(context, listen: false);
    dao = db.productsDao;
  }

  void _generateBarcode(int index) {
    final random = DateTime.now().millisecondsSinceEpoch;
    _barcodeControllers[index].text = "P$random";
  }

  void _addBarcodeField() {
    setState(() {
      _barcodeControllers.add(TextEditingController());
    });
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final barcodes = _barcodeControllers
        .map((e) => e.text.trim())
        .where((b) => b.isNotEmpty)
        .toList();

    final name = _nameController.text.trim();
    final cost = double.tryParse(_primaryCostController.text) ?? 0;
    final price = double.tryParse(_primaryPriceController.text) ?? 0;

    // ✅ تحقق من السعر
    if (price < cost) {
      _showError("لا يمكن إتمام العملية: سعر البيع أقل من الكلفة");
      return;
    }

    // ✅ تحقق من تكرار الباركود (مع استثناء نفس المنتج)
    for (final code in barcodes) {
      if (await dao.isBarcodeExists(code, excludeId: widget.product.id)) {
        _showError("الرمز $code موجود مسبقًا");
        return;
      }
    }

    // ✅ تحقق من الاسم التجاري (مع استثناء نفس المنتج)
    if (await dao.isNameExists(name, excludeId: widget.product.id)) {
      _showError("الاسم التجاري '$name' موجود مسبقًا");
      return;
    }

    final updated = ProductModel(
      barcodes: barcodes,
      name: name,
      scientific: _scientificController.text.trim(),
      company: _companyController.text.trim(),
      group: _groupController.text.trim(),
      unit: _unitController.text.trim(),
      primaryCost: cost,
      primaryPrice: price,
      secondaryUnitName:
          showSecondary ? _secondaryUnitController.text.trim() : null,
      packing: showSecondary ? int.tryParse(_packingController.text) ?? 1 : 1,
      secondaryCost:
          showSecondary ? double.tryParse(_secondaryCostController.text) : null,
      secondaryPrice: showSecondary
          ? double.tryParse(_secondaryPriceController.text)
          : null,
    );

    Navigator.of(context).pop(updated);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white.withValues(alpha: 0.95),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text(
        'تعديل المنتج',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      content: Container(
        width: 500,
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ..._barcodeControllers.asMap().entries.map((entry) {
                  final index = entry.key;
                  final controller = entry.value;
                  return Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller,
                          decoration: InputDecoration(
                              labelText: 'رمز المنتج ${index + 1}'),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.qr_code),
                        onPressed: () => _generateBarcode(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.print),
                        onPressed: () async {
                          if (controller.text.trim().isEmpty) return;
                          final doc = pw.Document();
                          doc.addPage(
                            pw.Page(
                              build: (pw.Context context) {
                                return pw.Center(
                                  child: pw.BarcodeWidget(
                                    barcode: pw.Barcode.code128(),
                                    data: controller.text,
                                    width: 200,
                                    height: 80,
                                    drawText: true,
                                  ),
                                );
                              },
                            ),
                          );
                          await Printing.layoutPdf(
                            onLayout: (format) async => doc.save(),
                          );
                        },
                      ),
                    ],
                  );
                }),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('إضافة رمز آخر'),
                    onPressed: _addBarcodeField,
                  ),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'الاسم التجاري'),
                  validator: (value) =>
                      value == null || value.trim().isEmpty ? 'مطلوب' : null,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                ),
                TextFormField(
                  controller: _scientificController,
                  decoration: const InputDecoration(labelText: 'الاسم العلمي'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                ),
                TextFormField(
                  controller: _companyController,
                  decoration: const InputDecoration(labelText: 'الشركة'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                ),
                TextFormField(
                  controller: _groupController,
                  decoration: const InputDecoration(labelText: 'المجموعة'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                ),
                TextFormField(
                  controller: _unitController,
                  decoration:
                      const InputDecoration(labelText: 'الوحدة الأولية'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                ),
                TextFormField(
                  controller: _primaryCostController,
                  decoration: const InputDecoration(labelText: 'الكلفة 1'),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                ),
                TextFormField(
                  controller: _primaryPriceController,
                  decoration: const InputDecoration(labelText: 'السعر 1'),
                  keyboardType: TextInputType.number,
                  textInputAction: showSecondary
                      ? TextInputAction.next
                      : TextInputAction.done,
                  onFieldSubmitted: (_) {
                    if (showSecondary) {
                      FocusScope.of(context).nextFocus();
                    } else {
                      _submit();
                    }
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Checkbox(
                      value: showSecondary,
                      onChanged: (val) {
                        setState(() {
                          showSecondary = val ?? false;
                        });
                      },
                    ),
                    const Text("إضافة وحدة ثانوية"),
                  ],
                ),
                if (showSecondary) ...[
                  TextFormField(
                    controller: _secondaryUnitController,
                    decoration:
                        const InputDecoration(labelText: 'الوحدة الثانوية'),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  ),
                  TextFormField(
                    controller: _packingController,
                    decoration: const InputDecoration(labelText: 'التعبئة'),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  ),
                  TextFormField(
                    controller: _secondaryCostController,
                    decoration: const InputDecoration(labelText: 'الكلفة 2'),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  ),
                  TextFormField(
                    controller: _secondaryPriceController,
                    decoration: const InputDecoration(labelText: 'السعر 2'),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _submit(),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('تعديل'),
        ),
      ],
    );
  }
}
