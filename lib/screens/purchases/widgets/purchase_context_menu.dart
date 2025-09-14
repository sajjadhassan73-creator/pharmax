// lib/screens/purchases/widgets/purchase_context_menu.dart
import 'package:flutter/material.dart';

import '../../../database/app_database.dart';
import '../../../models/purchase_item.dart';
import '../../../models/product_model.dart';
import '../../products/edit_product_dialog.dart';
import 'product_details_dialog.dart';
import 'latest_cost_dialog.dart';
import 'cheapest_purchase_dialog.dart';

class PurchaseContextMenu {
  static Future<void> show(
    BuildContext context, {
    required int index,
    required PurchaseItem item,
    required List<ProductModel> allProducts,
    required AppDatabase db,
    required void Function(int index, PurchaseItem updated) onUpdate,
    required void Function(int index) onDelete,
    required Offset position,
  }) async {
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        overlay.size.width - position.dx,
        overlay.size.height - position.dy,
      ),
      items: const [
        PopupMenuItem(value: 'details', child: Text('تفاصيل المنتج')),
        PopupMenuItem(value: 'edit', child: Text('تعديل المنتج')),
        PopupMenuItem(value: 'latestCost', child: Text('آخر كلفة')),
        PopupMenuItem(value: 'cheapestCost', child: Text('أرخص كلفة')),
        PopupMenuItem(value: 'delete', child: Text('حذف')),
      ],
    );

    if (selected == null) return;

    switch (selected) {
      case 'details':
        await showDialog(
          context: context,
          builder: (_) => ProductDetailsDialog(item: item),
        );
        break;

      case 'edit':
        final prod = allProducts.firstWhere(
          (p) => (p.id ?? -1) == item.productId,
          orElse: () => ProductModel(
            id: null,
            barcodes: const [],
            name: item.name,
            unit: item.unit,
            primaryCost: item.cost,
            primaryPrice: item.price,
          ),
        );
        final updated = await showDialog<ProductModel>(
          context: context,
          builder: (_) =>
              EditProductDialog(product: prod, barcodes: prod.barcodes),
        );
        if (updated != null) {
          final newItem = item.copyWith(
            name: updated.name,
            unit: updated.unit,
            cost: updated.primaryCost,
            price: updated.primaryPrice,
            isManualPrice: false,
          );
          onUpdate(index, newItem);
        }
        break;

      case 'latestCost':
        await showDialog(
          context: context,
          builder: (_) => LatestCostDialog(
            dao: db.purchaseInvoiceItemsDao,
            productId: item.productId,
          ),
        );
        break;

      case 'cheapestCost':
        await showDialog(
          context: context,
          builder: (_) => CheapestPurchaseDialog(
            dao: db.purchaseInvoiceItemsDao,
            productId: item.productId,
          ),
        );
        break;

      case 'delete':
        onDelete(index);
        break;
    }
  }
}
