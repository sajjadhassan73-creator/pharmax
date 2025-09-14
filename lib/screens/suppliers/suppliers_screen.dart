import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart';

import '../../database/app_database.dart';
import '../../database/daos/suppliers_dao.dart';
import '../../models/supplier_model.dart';
import 'add_supplier_dialog.dart';
import 'edit_supplier_dialog.dart';

class SuppliersScreen extends StatefulWidget {
  const SuppliersScreen({super.key});

  @override
  State<SuppliersScreen> createState() => _SuppliersScreenState();
}

class _SuppliersScreenState extends State<SuppliersScreen> {
  late AppDatabase db;
  late SuppliersDao dao;

  List<SupplierData> suppliers = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    db = Provider.of<AppDatabase>(context);
    dao = db.suppliersDao;
    _loadSuppliers();
  }

  Future<void> _loadSuppliers() async {
    final data = await dao.getAllSuppliers();
    setState(() {
      suppliers = data;
    });
  }

  Future<void> _showAddDialog() async {
    final result = await showDialog<SupplierModel>(
      context: context,
      builder: (_) => const AddSupplierDialog(),
    );

    if (result != null) {
      await dao.insertSupplier(result.toCompanion());
      await _loadSuppliers();
    }
  }

  Future<void> _showEditDialog(SupplierData supplier) async {
    final result = await showDialog<SupplierModel>(
      context: context,
      builder: (_) => EditSupplierDialog(
        supplier: SupplierModel.fromDrift(supplier),
      ),
    );

    if (result != null) {
      final updated = SuppliersCompanion(
        id: Value(supplier.id),
        name: Value(result.name),
        phone: Value(result.phone),
        email: Value(result.email),
        address: Value(result.address),
        notes: Value(result.notes),
      );

      await dao.updateSupplier(updated);
      await _loadSuppliers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الموردين'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: suppliers.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final supplier = suppliers[index];
          return ListTile(
            title: Text(supplier.name),
            subtitle: Text(supplier.phone ?? ''),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _showEditDialog(supplier),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        tooltip: 'إضافة مورد',
        child: const Icon(Icons.add),
      ),
    );
  }
}
