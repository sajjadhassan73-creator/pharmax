import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../database/app_database.dart';
import '../../database/daos/products_dao.dart';
import '../../models/product_model.dart';

class AddProductDialog extends StatefulWidget {
  const AddProductDialog({super.key});

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final _formKey = GlobalKey<FormState>();

  final List<TextEditingController> _barcodeControllers = [
    TextEditingController()
  ];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _scientificController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _groupController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _primaryCostController = TextEditingController();
  final TextEditingController _primaryPriceController = TextEditingController();

  bool showSecondaryUnit = false;
  final TextEditingController _secondaryUnitController =
      TextEditingController();
  final TextEditingController _packingController = TextEditingController();
  final TextEditingController _secondaryCostController =
      TextEditingController();
  final TextEditingController _secondaryPriceController =
      TextEditingController();

  late ProductsDao dao;

  // ✅ FocusNodes
  final _nameFocus = FocusNode();
  final _scientificFocus = FocusNode();
  final _companyFocus = FocusNode();
  final _groupFocus = FocusNode();
  final _unitFocus = FocusNode();
  final _costFocus = FocusNode();
  final _priceFocus = FocusNode();
  final _secUnitFocus = FocusNode();
  final _packingFocus = FocusNode();
  final _secCostFocus = FocusNode();
  final _secPriceFocus = FocusNode();

  @override
  void dispose() {
    _nameFocus.dispose();
    _scientificFocus.dispose();
    _companyFocus.dispose();
    _groupFocus.dispose();
    _unitFocus.dispose();
    _costFocus.dispose();
    _priceFocus.dispose();
    _secUnitFocus.dispose();
    _packingFocus.dispose();
    _secCostFocus.dispose();
    _secPriceFocus.dispose();
    super.dispose();
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

  void _printBarcode(String barcodeText) async {
    if (barcodeText.isEmpty) return;
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.BarcodeWidget(
            data: barcodeText,
            barcode: pw.Barcode.code128(),
            width: 200,
            height: 80,
          ),
        ),
      ),
    );
    await Printing.layoutPdf(onLayout: (format) => doc.save());
  }

  void _calculateSecondaryValues() {
    final cost1 = double.tryParse(_primaryCostController.text) ?? 0;
    final price1 = double.tryParse(_primaryPriceController.text) ?? 0;
    final packing = int.tryParse(_packingController.text) ?? 1;

    if (packing > 0) {
      _secondaryCostController.text = (cost1 / packing).toStringAsFixed(2);
      _secondaryPriceController.text = (price1 / packing).toStringAsFixed(2);
    }
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
    if (_formKey.currentState!.validate()) {
      final barcodes = _barcodeControllers
          .map((e) => e.text.trim())
          .where((b) => b.isNotEmpty)
          .toList();

      if (barcodes.isEmpty) {
        final generated = "P${DateTime.now().millisecondsSinceEpoch}";
        barcodes.add(generated);
      }

      final name = _nameController.text.trim();
      final cost = double.tryParse(_primaryCostController.text) ?? 0;
      final price = double.tryParse(_primaryPriceController.text) ?? 0;

      if (price < cost) {
        _showError("لا يمكن إتمام العملية: سعر البيع أقل من الكلفة");
        return;
      }

      for (final code in barcodes) {
        if (await dao.isBarcodeExists(code)) {
          _showError("الرمز $code موجود مسبقًا");
          return;
        }
      }

      if (await dao.isNameExists(name)) {
        _showError("الاسم التجاري '$name' موجود مسبقًا");
        return;
      }

      final product = ProductModel(
        barcodes: barcodes,
        name: name,
        scientific: _scientificController.text.trim(),
        company: _companyController.text.trim(),
        group: _groupController.text.trim(),
        unit: _unitController.text.trim(),
        primaryCost: cost,
        primaryPrice: price,
        secondaryUnitName:
            showSecondaryUnit ? _secondaryUnitController.text.trim() : null,
        packing:
            showSecondaryUnit ? int.tryParse(_packingController.text) ?? 1 : 1,
        secondaryCost: showSecondaryUnit
            ? double.tryParse(_secondaryCostController.text)
            : null,
        secondaryPrice: showSecondaryUnit
            ? double.tryParse(_secondaryPriceController.text)
            : null,
      );

      Navigator.pop(context, product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white.withOpacity(0.95), // خلفية شبه شفافة
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'إضافة منتج',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // الرموز
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
                              FocusScope.of(context).requestFocus(_nameFocus),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.qr_code),
                        onPressed: () => _generateBarcode(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.print),
                        onPressed: () => _printBarcode(controller.text),
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

                // باقي الحقول
                TextFormField(
                  controller: _nameController,
                  focusNode: _nameFocus,
                  decoration: const InputDecoration(labelText: 'الاسم التجاري'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_scientificFocus),
                ),
                TextFormField(
                  controller: _scientificController,
                  focusNode: _scientificFocus,
                  decoration: const InputDecoration(labelText: 'الاسم العلمي'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_companyFocus),
                ),
                TextFormField(
                  controller: _companyController,
                  focusNode: _companyFocus,
                  decoration: const InputDecoration(labelText: 'الشركة'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_groupFocus),
                ),
                TextFormField(
                  controller: _groupController,
                  focusNode: _groupFocus,
                  decoration: const InputDecoration(labelText: 'المجموعة'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_unitFocus),
                ),
                TextFormField(
                  controller: _unitController,
                  focusNode: _unitFocus,
                  decoration:
                      const InputDecoration(labelText: 'الوحدة الأولية'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_costFocus),
                ),
                TextFormField(
                  controller: _primaryCostController,
                  focusNode: _costFocus,
                  decoration: const InputDecoration(labelText: 'الكلفة 1'),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_priceFocus),
                ),
                TextFormField(
                  controller: _primaryPriceController,
                  focusNode: _priceFocus,
                  decoration: const InputDecoration(labelText: 'السعر 1'),
                  keyboardType: TextInputType.number,
                  textInputAction: showSecondaryUnit
                      ? TextInputAction.next
                      : TextInputAction.done,
                  onFieldSubmitted: (_) {
                    if (showSecondaryUnit) {
                      FocusScope.of(context).requestFocus(_secUnitFocus);
                    } else {
                      _submit();
                    }
                  },
                ),

                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () =>
                      setState(() => showSecondaryUnit = !showSecondaryUnit),
                  icon: const Icon(Icons.unfold_more),
                  label: const Text('الوحدة الثانوية'),
                ),
                if (showSecondaryUnit) ...[
                  TextFormField(
                    controller: _secondaryUnitController,
                    focusNode: _secUnitFocus,
                    decoration:
                        const InputDecoration(labelText: 'اسم الوحدة الثانوية'),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_packingFocus),
                  ),
                  TextFormField(
                    controller: _packingController,
                    focusNode: _packingFocus,
                    decoration: const InputDecoration(labelText: 'التعبئة'),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onChanged: (_) => _calculateSecondaryValues(),
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_secCostFocus),
                  ),
                  TextFormField(
                    controller: _secondaryCostController,
                    focusNode: _secCostFocus,
                    decoration: const InputDecoration(labelText: 'الكلفة 2'),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_secPriceFocus),
                  ),
                  TextFormField(
                    controller: _secondaryPriceController,
                    focusNode: _secPriceFocus,
                    decoration: const InputDecoration(labelText: 'السعر 2'),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _submit(),
                  ),
                ],

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('إلغاء')),
                    const SizedBox(width: 10),
                    ElevatedButton(
                        onPressed: _submit, child: const Text('حفظ')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
