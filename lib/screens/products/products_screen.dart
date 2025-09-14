import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/app_database.dart';
import '../../database/daos/products_dao.dart';
import '../../models/product_model.dart';
import 'add_product_dialog.dart';
import 'edit_product_dialog.dart';

import 'package:drift/drift.dart' hide Column;

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late AppDatabase db;
  late ProductsDao dao;

  List<ProductWithBarcodes> products = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    db = Provider.of<AppDatabase>(context);
    dao = db.productsDao;
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final data = await dao.getAllProducts();
    setState(() {
      products = data;
    });
  }

  Future<void> _showAddProductDialog() async {
    final result = await showDialog<ProductModel?>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const AddProductDialog(),
    );

    if (result != null) {
      final companion = ProductsCompanion(
        name: Value(result.name),
        mainBarcode:
            Value(result.barcodes.isNotEmpty ? result.barcodes.first : null),
        scientific: Value(result.scientific),
        company: Value(result.company),
        group: Value(result.group),
        primaryUnit: Value(result.unit),
        primaryCost: Value(result.primaryCost),
        primaryPrice: Value(result.primaryPrice),
        secondaryUnit: Value(result.secondaryUnitName),
        packing: Value(result.packing),
        secondaryCost: Value(result.secondaryCost),
        secondaryPrice: Value(result.secondaryPrice),
      );

      await dao.insertProduct(companion, result.barcodes);
      await _loadProducts();
    }
  }

  Future<void> _showEditProductDialog(ProductWithBarcodes item) async {
    final result = await showDialog<ProductModel?>(
      context: context,
      barrierDismissible: false,
      builder: (_) => EditProductDialog(
        product: ProductModel.fromDrift(
          item.product,
          item.barcodes,
        ),
        barcodes: item.barcodes,
      ),
    );

    if (result != null) {
      final companion = ProductsCompanion(
        name: Value(result.name),
        mainBarcode:
            Value(result.barcodes.isNotEmpty ? result.barcodes.first : null),
        scientific: Value(result.scientific),
        company: Value(result.company),
        group: Value(result.group),
        primaryUnit: Value(result.unit),
        primaryCost: Value(result.primaryCost),
        primaryPrice: Value(result.primaryPrice),
        secondaryUnit: Value(result.secondaryUnitName),
        packing: Value(result.packing),
        secondaryCost: Value(result.secondaryCost),
        secondaryPrice: Value(result.secondaryPrice),
      );

      await dao.updateProduct(item.product.id, companion, result.barcodes);
      await _loadProducts();
    }
  }

  void _showContextMenu(
      BuildContext context, Offset position, ProductWithBarcodes item) async {
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        position.dx,
        position.dy,
      ),
      items: const [
        PopupMenuItem(value: 'edit', child: Text('تعديل المنتج')),
      ],
    );

    if (selected == 'edit') {
      _showEditProductDialog(item);
    }
  }

  DataCell _buildCell(String text, ProductWithBarcodes product) {
    return DataCell(
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onSecondaryTapDown: (details) {
          _showContextMenu(context, details.globalPosition, product);
        },
        onLongPress: () {
          final box = context.findRenderObject() as RenderBox;
          final pos = box.localToGlobal(Offset.zero);
          _showContextMenu(context, pos, product);
        },
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: false,
        title: Row(
          children: const [
            Text(
              'المنتجات',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('#')),
            DataColumn(label: Text('الاسم التجاري')),
            DataColumn(label: Text('الاسم العلمي')),
            DataColumn(label: Text('الشركة')),
            DataColumn(label: Text('المجموعة')),
            DataColumn(label: Text('الوحدة الأولية')),
            DataColumn(label: Text('الكلفة 1')),
            DataColumn(label: Text('السعر 1')),
            DataColumn(label: Text('الوحدة الثانوية')),
            DataColumn(label: Text('التعبئة')),
            DataColumn(label: Text('الكلفة 2')),
            DataColumn(label: Text('السعر 2')),
          ],
          rows: List.generate(products.length, (index) {
            final product = products[index];
            return DataRow(
              cells: [
                _buildCell('${index + 1}', product),
                _buildCell(product.product.name, product),
                _buildCell(product.product.scientific ?? '', product),
                _buildCell(product.product.company ?? '', product),
                _buildCell(product.product.group ?? '', product),
                _buildCell(product.product.primaryUnit, product),
                _buildCell(product.product.primaryCost.toString(), product),
                _buildCell(product.product.primaryPrice.toString(), product),
                _buildCell(product.product.secondaryUnit ?? '-', product),
                _buildCell(product.product.packing.toString(), product),
                _buildCell(
                    product.product.secondaryCost?.toString() ?? '-', product),
                _buildCell(
                    product.product.secondaryPrice?.toString() ?? '-', product),
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ElevatedButton.icon(
              onPressed: _showAddProductDialog,
              icon: const Icon(Icons.add),
              label: const Text('إضافة منتج'),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: تنفيذ واجهة الجرد لاحقًا
              },
              icon: const Icon(Icons.inventory),
              label: const Text('جرد'),
            ),
          ],
        ),
      ),
    );
  }
}
