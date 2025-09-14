import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart'; // 🟢 لازم تكون موجودة بالـ pubspec.yaml

import '../../../database/app_database.dart';
import '../../../models/purchase_item.dart';
import '../../../models/product_model.dart';

import 'purchase_row.dart';
import 'purchase_add_row.dart';

class PurchasesTable extends StatefulWidget {
  final AppDatabase db;
  final void Function(PurchaseItem item) onAdd;
  final void Function(int index) onDelete;
  final void Function(int index, PurchaseItem updated) onUpdate;
  final List<PurchaseItem> items;
  final List<ProductModel> allProducts;

  const PurchasesTable({
    super.key,
    required this.db,
    required this.onAdd,
    required this.onDelete,
    required this.onUpdate,
    required this.items,
    required this.allProducts,
  });

  @override
  State<PurchasesTable> createState() => _PurchasesTableState();
}

class _PurchasesTableState extends State<PurchasesTable> {
  final ScrollController _verticalController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.allProducts.isEmpty)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "⚠️ لا توجد منتجات في قاعدة البيانات، أضف منتج أولاً.",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        Expanded(
          child: Scrollbar(
            controller: _verticalController,
            thumbVisibility: true,
            interactive: true,
            child: SingleChildScrollView(
              controller: _verticalController,
              scrollDirection: Axis.vertical,
              child: DataTable2(
                columnSpacing: 12,
                horizontalMargin: 8,
                minWidth: 1100, // ✅ يضمن أن كل الأعمدة تاخذ مكان مناسب
                dataRowHeight: 44,
                headingRowHeight: 48,
                columns: const [
                  DataColumn2(label: Text('#'), size: ColumnSize.S),
                  DataColumn2(label: Text('الرمز'), size: ColumnSize.S),
                  DataColumn2(label: Text('الاسم التجاري'), size: ColumnSize.L),
                  DataColumn2(label: Text('تاريخ النفاذ'), size: ColumnSize.M),
                  DataColumn2(label: Text('الوحدة'), size: ColumnSize.S),
                  DataColumn2(label: Text('الكمية'), size: ColumnSize.S),
                  DataColumn2(label: Text('الكلفة'), size: ColumnSize.M),
                  DataColumn2(label: Text('البونص'), size: ColumnSize.S),
                  DataColumn2(
                      label: Text('الكلفة بعد البونص'), size: ColumnSize.M),
                  DataColumn2(label: Text('نسبة الربح'), size: ColumnSize.S),
                  DataColumn2(label: Text('السعر 1'), size: ColumnSize.M),
                  DataColumn2(label: Text('السعر 2'), size: ColumnSize.M),
                  DataColumn2(label: Text('مجموع الكلفة'), size: ColumnSize.M),
                  DataColumn2(label: Text('مجموع السعر'), size: ColumnSize.M),
                ],
                rows: [
                  // 🟢 الصفوف الموجودة (لو عندك منتجات بالفاتورة)
                  ...List.generate(widget.items.length, (index) {
                    final item = widget.items[index];
                    return buildPurchaseRow(
                      context: context,
                      db: widget.db,
                      item: item,
                      index: index,
                      allProducts: widget.allProducts,
                      onUpdate: widget.onUpdate,
                      onDelete: widget.onDelete,
                    );
                  }),

                  // 🟢 صف الإضافة يبقى دائماً حتى لو القائمة فاضية
                  buildAddRow(
                    context: context,
                    db: widget.db,
                    allProducts: widget.allProducts,
                    onAdd: widget.onAdd,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
