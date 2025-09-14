import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../database/app_database.dart';
import '../../database/daos/customers_dao.dart';
import '../../models/customer_model.dart';
import 'add_customer_dialog.dart';
import 'edit_customer_dialog.dart';
import 'customer_details_screen.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  late AppDatabase db;
  late CustomersDao dao;
  List<CustomerModel> allCustomers = [];
  List<CustomerModel> filteredCustomers = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    db = Provider.of<AppDatabase>(context);
    dao = db.customersDao;
    _loadCustomers();
  }

  Future<void> _loadCustomers() async {
    final data = await dao.getAllCustomers();

    final models = data
        .map((e) => CustomerModel(
              id: e.id,
              name: e.name,
              phone: e.phone,
              email: e.email,
              address: e.address,
              notes: e.notes,
              medicalHistory: e.medicalHistory,
            ))
        .toList();

    setState(() {
      allCustomers = models;
      filteredCustomers = models;
    });
  }

  void _filterCustomers(String query) {
    final lower = query.toLowerCase();
    setState(() {
      filteredCustomers = allCustomers.where((c) {
        return c.name.toLowerCase().contains(lower) ||
            (c.phone ?? '').toLowerCase().contains(lower) ||
            (c.email ?? '').toLowerCase().contains(lower);
      }).toList();
    });
  }

  Future<void> _showAddDialog() async {
    final result = await showDialog<CustomerModel?>(
      context: context,
      builder: (_) => const AddCustomerDialog(),
    );

    if (result != null) {
      await dao.insertCustomer(result);
      await _loadCustomers();
    }
  }

  Future<void> _showEditDialog(CustomerModel customer) async {
    final result = await showDialog<CustomerModel?>(
      context: context,
      builder: (_) => EditCustomerDialog(customer: customer),
    );

    if (result != null) {
      await dao.updateCustomer(customer.id!, result);
      await _loadCustomers();
    }
  }

  Future<void> _deleteCustomer(int id) async {
    await dao.deleteCustomer(id);
    await _loadCustomers();
  }

  void _openCustomerDetails(CustomerModel customer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CustomerDetailsScreen(customer: customer),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الزبائن'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'بحث بالاسم أو الهاتف أو البريد',
                prefixIcon: const Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: _filterCustomers,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3 / 2,
              ),
              itemCount: filteredCustomers.length,
              itemBuilder: (_, index) {
                final customer = filteredCustomers[index];
                return GestureDetector(
                  onTap: () => _openCustomerDetails(customer),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(customer.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 4),
                          Text(customer.phone ?? '-',
                              style: const TextStyle(color: Colors.grey)),
                          Text(customer.email ?? '-',
                              style: const TextStyle(color: Colors.grey)),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _showEditDialog(customer),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _deleteCustomer(customer.id!),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
