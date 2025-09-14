// lib/screens/purchases/widgets/purchase_row.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:pharmax/database/app_database.dart';
import 'package:pharmax/models/product_model.dart';
import 'package:pharmax/models/purchase_item.dart';
import 'package:pharmax/screens/products/edit_product_dialog.dart';
import 'package:pharmax/screens/purchases/widgets/purchase_add_row.dart';
import 'package:pharmax/screens/purchases/widgets/purchase_context_menu.dart';
import 'package:pharmax/screens/purchases/widgets/purchase_text_field.dart';

// Helper function to build a DataRow for a purchase item
DataRow buildPurchaseRow({
  required BuildContext context,
  required AppDatabase db,
  required PurchaseItem item,
  required int index,
  required List<ProductModel> allProducts,
  required void Function(int index, PurchaseItem updatedItem) onUpdate,
  required void Function(int index) onDelete,
}) {
  final quantityController =
      TextEditingController(text: item.quantity.toString());
  final costController = TextEditingController(text: item.cost.toString());
  final bonusController = TextEditingController(text: item.bonus.toString());
  final profitController =
      TextEditingController(text: item.profitPercentage.toString());
  final priceController = TextEditingController(text: item.price.toString());

  // Find the product to get its barcode
  final prod = allProducts.firstWhere(
    (product) => product.id == item.productId,
    orElse: () => ProductModel(
        id: item.productId,
        name: item.name,
        barcodes: ['N/A'],
        unit: item.unit,
        primaryCost: 0,
        primaryPrice: 0),
  );

  // Helper function to calculate cost after bonus
  double calculateCostAfterBonus(double cost, int quantity, int bonus) {
    if ((quantity + bonus) == 0) return 0.0;
    return (cost * quantity) / (quantity + bonus);
  }

  // Helper function to show a custom context menu
  void showContextMenu(BuildContext context, Offset position) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        position.dx,
        position.dy,
      ),
      items: getContextMenuItems(
        context: context,
        db: db,
        onEdit: () async {
          final result = await showDialog<ProductModel>(
            context: context,
            builder: (context) => EditProductDialog(
              db: db,
              product: prod,
            ),
          );
          // If the user saves changes, update the product
          if (result != null) {
            // No need to use a variable here
          }
        },
        onDelete: () => onDelete(index),
        onAddSimilar: () {
          showDialog(
            context: context,
            builder: (context) => PurchaseAddRow(
              db: db,
              initialProduct: prod,
              onAdd: (newItem) {
                // Here you would add the new item to your list in the parent widget
                // onAdd(newItem);
              },
            ),
          );
        },
        onCopyBarcode: () {
          // TODO: Implement barcode copy
        },
      ),
    );
  }

  // Calculate the cost after bonus and profit percentage
  final costAfterBonus =
      calculateCostAfterBonus(item.cost, item.quantity, item.bonus);
  final profitPercentage =
      ((item.price - costAfterBonus) / costAfterBonus) * 100;

  return DataRow(
    onLongPress: () {
      final RenderBox overlay = context.findRenderObject() as RenderBox;
      final position = overlay.localToGlobal(Offset.zero);
      showContextMenu(context, position);
    },
    cells: <DataCell>[
      DataCell(Text((index + 1).toString())),
      DataCell(
        Text(prod.barcodes.first),
      ),
      DataCell(Text(item.name)),
      DataCell(
        Text(intl.DateFormat('yyyy-MM-dd').format(item.expiry)),
      ),
      DataCell(
        PurchaseTextField(
          controller: quantityController,
          label: '',
          onChanged: (value) {
            final quantity = int.tryParse(value) ?? 0;
            onUpdate(
              index,
              item.copyWith(
                quantity: quantity,
              ),
            );
          },
        ),
      ),
      DataCell(Text(item.unit)),
      DataCell(
        PurchaseTextField(
          controller: costController,
          label: '',
          onChanged: (value) {
            final cost = double.tryParse(value) ?? 0.0;
            onUpdate(
              index,
              item.copyWith(
                cost: cost,
              ),
            );
          },
        ),
      ),
      DataCell(
        PurchaseTextField(
          controller: bonusController,
          label: '',
          onChanged: (value) {
            final bonus = int.tryParse(value) ?? 0;
            onUpdate(
              index,
              item.copyWith(
                bonus: bonus,
              ),
            );
          },
        ),
      ),
      DataCell(Text(costAfterBonus.toStringAsFixed(2))),
      DataCell(
        PurchaseTextField(
          controller: profitController,
          label: '',
          onChanged: (value) {
            final newProfitPercentage = double.tryParse(value) ?? 0.0;
            final newPrice = costAfterBonus * (1 + newProfitPercentage / 100);
            onUpdate(
              index,
              item.copyWith(
                profitPercentage: newProfitPercentage,
                price: newPrice,
              ),
            );
          },
        ),
      ),
      DataCell(
        PurchaseTextField(
          controller: priceController,
          label: '',
          onChanged: (value) {
            final newPrice = double.tryParse(value) ?? 0.0;
            final newProfitPercentage =
                ((newPrice - costAfterBonus) / costAfterBonus) * 100;
            onUpdate(
              index,
              item.copyWith(
                price: newPrice,
                profitPercentage: newProfitPercentage,
              ),
            );
          },
        ),
      ),
      DataCell(
        PurchaseTextField(
          controller:
              TextEditingController(text: ''), // No associated data for price2
          label: '',
          onChanged: (value) {
            // Price 2 field logic
          },
        ),
      ),
    ],
  );
}
