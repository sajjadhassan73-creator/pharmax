// lib/screens/suppliers/supplier_typeahead_field.dart
import 'package:flutter/material.dart';

import '../../database/app_database.dart';
import '../../models/supplier_model.dart';
import 'add_supplier_dialog.dart';

class SupplierTypeAheadField extends StatefulWidget {
  final AppDatabase db;
  final void Function(SupplierModel) onSupplierSelected;

  const SupplierTypeAheadField({
    super.key,
    required this.db,
    required this.onSupplierSelected,
  });

  @override
  State<SupplierTypeAheadField> createState() => _SupplierTypeAheadFieldState();
}

class _SupplierTypeAheadFieldState extends State<SupplierTypeAheadField> {
  final TextEditingController _controller = TextEditingController();
  List<SupplierModel> _suppliers = [];

  Future<void> _loadSuppliers() async {
    final rows = await widget.db.suppliersDao.getAllSuppliers();
    setState(() {
      _suppliers = rows.map((row) => SupplierModel.fromDrift(row)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSuppliers();
  }

  void _handleNotFound(String name) async {
    final newSupplier = await showDialog<SupplierModel>(
      context: context,
      builder: (_) => AddSupplierDialog(initialName: name),
    );
    if (newSupplier != null) {
      setState(() {
        _suppliers.add(newSupplier);
      });
      _controller.text = newSupplier.name;
      widget.onSupplierSelected(newSupplier);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<SupplierModel>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        final q = textEditingValue.text.trim();
        if (q.isEmpty) return _suppliers;
        return _suppliers.where(
          (s) => s.name.toLowerCase().contains(q.toLowerCase()),
        );
      },
      displayStringForOption: (SupplierModel option) => option.name,
      onSelected: (supplier) {
        _controller.text = supplier.name;
        widget.onSupplierSelected(supplier);
      },
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        _controller.value = controller.value;
        return TextField(
          controller: _controller,
          focusNode: focusNode,
          decoration: const InputDecoration(
            labelText: 'اختر المورد',
            hintText: 'اكتب اسم المورد…',
            filled: true,
            fillColor: Colors.white,
          ),
          onSubmitted: (value) {
            final match = _suppliers.where((s) => s.name == value).toList();
            if (match.isEmpty) {
              _handleNotFound(value);
            } else {
              widget.onSupplierSelected(match.first);
            }
          },
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            child: SizedBox(
              width: 400,
              height: 240,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options.elementAt(index);
                  return ListTile(
                    title: Text(option.name),
                    subtitle: (option.phone?.isNotEmpty ?? false)
                        ? Text(option.phone!)
                        : null,
                    onTap: () => onSelected(option),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
