import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/app_database.dart';
import '../../logic/purchases_logic.dart';
import '../../models/purchase_item.dart';
import '../../models/product_model.dart';
import '../../models/supplier_model.dart';

import 'widgets/purchases_table.dart';
import 'widgets/purchases_top_section.dart';
import 'widgets/purchases_bottom_section.dart';
import 'widgets/discount_dialog.dart';
import 'widgets/previous_invoices_dialog.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({super.key});

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  late AppDatabase db;
  final PurchasesLogic logic = PurchasesLogic();

  final TextEditingController _invoiceCodeController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  SupplierModel? _selectedSupplier;

  String _discountType = "مبلغ";
  final String _paymentType = "نقدي";

  bool _isEditing = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    db = Provider.of<AppDatabase>(context);
  }

  Future<bool> _onWillPop() async {
    if (logic.itemsNotifier.value.isNotEmpty) {
      final shouldExit = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("تنبيه"),
          content: const Text(
              "هناك فاتورة مفتوحة تحتوي على منتجات.\nهل تريد الخروج بدون حفظ؟"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text("لا"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: const Text("نعم"),
            ),
          ],
        ),
      );
      return shouldExit ?? false;
    }
    return true;
  }

  void _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _showPreviousInvoices() async {
    final invoices = await db.purchaseInvoicesDao.getAllInvoices();
    if (!mounted) return;

    showDialog(
      context: context,
      builder: (_) => PreviousInvoicesDialog(
        invoices: invoices,
        logic: logic,
        db: db,
        onInvoiceSelected: (invoice) async {
          final supplier =
              await db.suppliersDao.getSupplierById(invoice.supplierId);

          setState(() {
            _isEditing = true;
            _notesController.text = invoice.notes ?? "";
            _invoiceCodeController.text = invoice.invoiceCode;
            _selectedDate = invoice.date;

            if (supplier != null) {
              _selectedSupplier = SupplierModel.fromDrift(supplier);
            }
          });

          debugPrint(
              "🔄 تم تحميل فاتورة رقم ${invoice.invoiceCode} - المورد: ${_selectedSupplier?.name}");
        },
      ),
    );
  }

  void _showDiscountDialog() {
    showDialog(
      context: context,
      builder: (_) => DiscountDialog(
        logic: logic,
        discountController: _discountController,
        currentType: _discountType,
        onApplied: (type, _) {
          setState(() => _discountType = type);
        },
      ),
    );
  }

  Future<void> _saveInvoice() async {
    if (_invoiceCodeController.text.trim().isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("يجب إدخال رقم الفاتورة")),
      );
      return;
    }
    if (_selectedSupplier == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("يجب اختيار المورد")),
      );
      return;
    }

    if (_isEditing) {
      await logic.updateInvoice(
        db: db,
        supplier: _selectedSupplier!,
        invoiceCode: _invoiceCodeController.text.trim(),
        date: _selectedDate,
        paymentType: _paymentType,
        discount: double.tryParse(_discountController.text) ?? 0,
        discountType: _discountType,
        notes: _notesController.text.trim(),
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("تم تعديل الفاتورة بنجاح ✏️")),
      );
    } else {
      await logic.saveInvoice(
        db: db,
        supplier: _selectedSupplier!,
        invoiceCode: _invoiceCodeController.text.trim(),
        date: _selectedDate,
        paymentType: _paymentType,
        discount: double.tryParse(_discountController.text) ?? 0,
        discountType: _discountType,
        notes: _notesController.text.trim(),
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("تم حفظ الفاتورة بنجاح ✅")),
      );
    }

    _clearForm();
  }

  void _deleteInvoice() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("تأكيد الحذف"),
        content: const Text("هل تريد حذف هذه الفاتورة نهائياً؟"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text("إلغاء"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text("نعم"),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await logic.deleteInvoice(db: db);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("تم حذف الفاتورة ❌")),
      );

      _clearForm();
    }
  }

  void _clearForm() {
    setState(() {
      logic.clear();
      _invoiceCodeController.clear();
      _discountController.clear();
      _notesController.clear();
      _selectedSupplier = null;
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldExit = await _onWillPop();
        if (shouldExit && mounted) Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text("المشتريات", style: TextStyle(color: Colors.black)),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: [
            PurchasesTopSection(
              db: db,
              date: _selectedDate,
              onDatePick: _pickDate,
              onSupplierSelected: (supplier) {
                setState(() => _selectedSupplier = supplier);
              },
              invoiceCodeController: _invoiceCodeController,
              selectedSupplier: _selectedSupplier,
            ),
            const Divider(height: 1, thickness: 1, color: Colors.grey),
            Expanded(
              flex: 9,
              child: FutureBuilder(
                future: db.productsDao.getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("خطأ: ${snapshot.error}"));
                  }

                  // ✅ نتأكد حتى لو ماكو منتجات
                  final allProducts = (snapshot.data ?? [])
                      .map<ProductModel>(
                          (p) => ProductModel.fromDrift(p.product, p.barcodes))
                      .toList();

                  debugPrint("📦 عدد المنتجات المحملة: ${allProducts.length}");

                  return ValueListenableBuilder<List<PurchaseItem>>(
                    valueListenable: logic.itemsNotifier,
                    builder: (context, items, _) {
                      return PurchasesTable(
                        db: db,
                        items: items,
                        onAdd: logic.addItem,
                        onDelete: logic.deleteItem,
                        onUpdate: logic.updateItem,
                        allProducts: allProducts,
                      );
                    },
                  );
                },
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Colors.grey),
            PurchasesBottomSection(
              logic: logic,
              db: db,
              notesController: _notesController,
              discountController: _discountController,
              discountType: _discountType,
              isEditing: _isEditing,
              onShowPreviousInvoices: _showPreviousInvoices,
              onClearOrDelete: () {
                if (_isEditing) {
                  _deleteInvoice();
                } else {
                  _clearForm();
                }
              },
              onShowDiscount: _showDiscountDialog,
              onSaveInvoice: _saveInvoice,
              onPrintInvoice: () {
                final note = _notesController.text.trim();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("طباعة الفاتورة\nملاحظة: $note")),
                );
              },
              onNewInvoice: _clearForm,
            ),
          ],
        ),
      ),
    );
  }
}
