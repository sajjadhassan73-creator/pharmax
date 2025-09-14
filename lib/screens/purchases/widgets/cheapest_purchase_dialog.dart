import 'package:flutter/material.dart';
import '../../../database/daos/purchase_invoice_items_dao.dart';
import '../../../models/purchase_invoice_item_model.dart';

class CheapestPurchaseDialog extends StatelessWidget {
  final PurchaseInvoiceItemsDao dao;
  final int productId;

  const CheapestPurchaseDialog({
    super.key,
    required this.dao,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PurchaseInvoiceItemModel?>(
      future: dao.getCheapestPurchasePrice(productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AlertDialog(
            title: Text('أرخص كلفة'),
            content: SizedBox(
              height: 60,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return AlertDialog(
            title: const Text('أرخص كلفة'),
            content: const Text('لا توجد مشتريات سابقة لهذا المنتج.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('إغلاق'),
              ),
            ],
          );
        }

        final item = snapshot.data!;
        return AlertDialog(
          title: const Text('أرخص كلفة'),
          content: Text(
            'اسم المنتج: ${item.name}\n'
            'الوحدة: ${item.unit}\n'
            'الكلفة: ${item.cost}\n'
            'السعر: ${item.price}\n'
            'تاريخ النفاذ: ${item.expiry}',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إغلاق'),
            ),
          ],
        );
      },
    );
  }
}
