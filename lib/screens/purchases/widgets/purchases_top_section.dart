// lib/screens/purchases/widgets/purchases_top_section.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../database/app_database.dart';
import '../../suppliers/add_supplier_dialog.dart';
import '../../../models/supplier_model.dart';

class PurchasesTopSection extends StatefulWidget {
  final AppDatabase db;
  final DateTime date;
  final VoidCallback onDatePick;
  final void Function(SupplierModel?) onSupplierSelected;
  final TextEditingController invoiceCodeController;
  final SupplierModel? selectedSupplier;

  const PurchasesTopSection({
    super.key,
    required this.db,
    required this.date,
    required this.onDatePick,
    required this.onSupplierSelected,
    required this.invoiceCodeController,
    required this.selectedSupplier,
  });

  @override
  State<PurchasesTopSection> createState() => _PurchasesTopSectionState();
}

class _PurchasesTopSectionState extends State<PurchasesTopSection> {
  List<SupplierModel> _suppliers = [];

  @override
  void initState() {
    super.initState();
    _loadSuppliers();
  }

  Future<void> _loadSuppliers() async {
    final rows = await widget.db.suppliersDao.getAllSuppliers();
    setState(() {
      _suppliers = rows.map((row) => SupplierModel.fromDrift(row)).toList();
    });
  }

  Future<void> _addSupplier() async {
    final newSupplier = await showDialog<SupplierModel>(
      context: context,
      builder: (_) => const AddSupplierDialog(),
    );

    if (newSupplier != null) {
      final newId = await widget.db.suppliersDao
          .insertSupplier(newSupplier.toCompanion());

      final supplierWithId = newSupplier.copyWith(id: newId);

      setState(() {
        _suppliers.add(supplierWithId);
      });

      widget.onSupplierSelected(supplierWithId);
      debugPrint(
          "🟢 تمت إضافة المورد: ${supplierWithId.id} - ${supplierWithId.name}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // 🟢 اختيار المورد
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<SupplierModel>(
                    value: widget.selectedSupplier != null &&
                            _suppliers
                                .any((s) => s.id == widget.selectedSupplier!.id)
                        ? _suppliers.firstWhere(
                            (s) => s.id == widget.selectedSupplier!.id)
                        : null,
                    decoration: const InputDecoration(
                      labelText: 'اختر المورد *',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) =>
                        value == null ? "يجب اختيار المورد" : null,
                    items: _suppliers.map((s) {
                      return DropdownMenuItem<SupplierModel>(
                        value: s,
                        child: Text(s.name),
                      );
                    }).toList(),
                    onChanged: (supplier) {
                      widget.onSupplierSelected(supplier);
                    },
                  ),
                ),
                const SizedBox(width: 6),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.green),
                  tooltip: "إضافة مورد جديد",
                  onPressed: _addSupplier,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // 🟢 رقم الفاتورة
          Expanded(
            flex: 2,
            child: TextFormField(
              controller: widget.invoiceCodeController,
              decoration: const InputDecoration(
                labelText: "رقم الفاتورة *",
                filled: true,
                fillColor: Colors.white,
                prefixIcon:
                    Icon(Icons.confirmation_number, color: Colors.black),
              ),
              style: const TextStyle(color: Colors.black),
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? "يجب إدخال رقم الفاتورة"
                  : null,
            ),
          ),
          const SizedBox(width: 8),

          // 🟢 التاريخ
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: widget.onDatePick,
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: "التاريخ",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.date_range, color: Colors.black),
                ),
                child: Text(
                  DateFormat('yyyy-MM-dd').format(widget.date),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
