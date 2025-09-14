// lib/screens/purchases/widgets/purchase_context_menu.dart
import 'package:flutter/material.dart';
import 'package:pharmax/database/app_database.dart'; // Import the database
import 'package:pharmax/screens/products/edit_product_dialog.dart';

List<PopupMenuEntry<dynamic>> getContextMenuItems({
  required BuildContext context,
  required AppDatabase db,
  required VoidCallback onEdit,
  required VoidCallback onDelete,
  required VoidCallback onAddSimilar,
  required VoidCallback onCopyBarcode,
}) {
  return [
    PopupMenuItem(
      child: const Text('تعديل المنتج'),
      onTap: onEdit,
    ),
    PopupMenuItem(
      child: const Text('حذف الصنف'),
      onTap: onDelete,
    ),
    PopupMenuItem(
      child: const Text('إضافة صنف مشابه'),
      onTap: onAddSimilar,
    ),
    PopupMenuItem(
      child: const Text('نسخ الباركود'),
      onTap: onCopyBarcode,
    ),
  ];
}
