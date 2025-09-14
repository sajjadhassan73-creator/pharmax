import 'package:flutter/material.dart';
import '../database/app_database.dart';
import '../models/purchase_item.dart';
import '../models/purchase_invoice_item_model.dart';
import '../models/purchase_invoice.dart';
import '../models/supplier_model.dart';

class PurchasesLogic {
  SupplierModel? selectedSupplier; // ✅ المورد المختار يظل محفوظ هنا

  final List<PurchaseItem> _items = [];
  final ValueNotifier<List<PurchaseItem>> itemsNotifier = ValueNotifier([]);

  double discountValue = 0.0;
  String discountType = "مبلغ";
  int? _currentInvoiceId;
  String currentNotes = "";

  void addItem(PurchaseItem item) {
    _items.add(item);
    itemsNotifier.value = List.from(_items);
  }

  void deleteItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      itemsNotifier.value = List.from(_items);
    }
  }

  void updateItem(int index, PurchaseItem updated) {
    if (index >= 0 && index < _items.length) {
      _items[index] = updated;
      itemsNotifier.value = List.from(_items);
    }
  }

  double get totalCost {
    return _items.fold(0.0, (sum, item) {
      final costAfterBonus = _calcCostAfterBonus(item);
      return sum + (costAfterBonus * item.quantity);
    });
  }

  double get totalPrice {
    // 🟢 يبقى محسوب على السعر1 فقط
    return _items.fold(0.0, (sum, item) => sum + item.price * item.quantity);
  }

  double get finalTotal {
    if (discountValue <= 0) return totalCost;
    if (discountType == "نسبة") {
      return totalCost - (totalCost * discountValue / 100);
    } else {
      return totalCost - discountValue;
    }
  }

  void applyDiscount(String type, double value) {
    discountType = type;
    discountValue = value;
    itemsNotifier.value = List.from(_items);
  }

  void clear() {
    _items.clear();
    discountValue = 0.0;
    discountType = "مبلغ";
    _currentInvoiceId = null;
    currentNotes = "";
    selectedSupplier = null; // 🟢 نفرغ المورد
    itemsNotifier.value = [];
  }

  Future<void> saveInvoice({
    required AppDatabase db,
    required SupplierModel supplier,
    required String invoiceCode,
    required DateTime date,
    required String paymentType,
    required double discount,
    required String discountType,
    String? notes,
  }) async {
    final invoiceModel = PurchaseInvoiceModel(
      supplierId: supplier.id!,
      invoiceCode: invoiceCode,
      date: date,
      totalCost: totalCost,
      totalPrice: totalPrice,
      paymentType: paymentType,
      discount: discount,
      discountType: discountType,
      notes: notes,
    );

    final invoiceId = await db.purchaseInvoicesDao.insertInvoice(invoiceModel);

    final itemsToInsert = _items.map((item) {
      return PurchaseInvoiceItemModel(
        id: null,
        invoiceId: invoiceId,
        productId: item.productId,
        name: item.name,
        unit: item.unit,
        expiry: item.expiry,
        quantity: item.quantity,
        cost: item.cost,
        bonus: item.bonus,
        costAfterBonus: _calcCostAfterBonus(item),
        profitPercent: item.profitPercentage,
        price: item.price,
        price2: item.price2, // 🆕 تخزين السعر 2
      );
    }).toList();

    await db.purchaseInvoiceItemsDao.insertItems(itemsToInsert, invoiceId);

    _currentInvoiceId = invoiceId;
    currentNotes = notes ?? "";
    clear();
  }

  Future<void> updateInvoice({
    required AppDatabase db,
    required SupplierModel supplier,
    required String invoiceCode,
    required DateTime date,
    required String paymentType,
    required double discount,
    required String discountType,
    String? notes,
  }) async {
    if (_currentInvoiceId == null) return;

    final updatedInvoice = PurchaseInvoiceModel(
      id: _currentInvoiceId,
      supplierId: supplier.id!,
      invoiceCode: invoiceCode,
      date: date,
      totalCost: totalCost,
      totalPrice: totalPrice,
      paymentType: paymentType,
      discount: discount,
      discountType: discountType,
      notes: notes,
    );

    await db.purchaseInvoicesDao.updateInvoice(updatedInvoice);

    await db.purchaseInvoiceItemsDao.deleteItemsByInvoiceId(_currentInvoiceId!);

    final itemsToInsert = _items.map((item) {
      return PurchaseInvoiceItemModel(
        id: null,
        invoiceId: _currentInvoiceId!,
        productId: item.productId,
        name: item.name,
        unit: item.unit,
        expiry: item.expiry,
        quantity: item.quantity,
        cost: item.cost,
        bonus: item.bonus,
        costAfterBonus: _calcCostAfterBonus(item),
        profitPercent: item.profitPercentage,
        price: item.price,
        price2: item.price2, // 🆕
      );
    }).toList();

    await db.purchaseInvoiceItemsDao
        .insertItems(itemsToInsert, _currentInvoiceId!);
    currentNotes = notes ?? "";
  }

  Future<void> deleteInvoice({required AppDatabase db}) async {
    if (_currentInvoiceId == null) return;

    await db.purchaseInvoiceItemsDao.deleteItemsByInvoiceId(_currentInvoiceId!);
    await db.purchaseInvoicesDao.deleteInvoice(_currentInvoiceId!);

    clear();
  }

  Future<void> loadInvoice({
    required AppDatabase db,
    required int invoiceId,
  }) async {
    final invoice = await db.purchaseInvoicesDao.getInvoiceById(invoiceId);
    if (invoice == null) return;

    final items =
        await db.purchaseInvoiceItemsDao.getItemsByInvoiceId(invoiceId);

    _items
      ..clear()
      ..addAll(items.map((e) => PurchaseItem.fromInvoiceItem(e)));

    discountValue = invoice.discount;
    discountType = invoice.discountType;
    _currentInvoiceId = invoice.id;
    currentNotes = invoice.notes ?? "";

    itemsNotifier.value = List.from(_items);
  }

  double _calcCostAfterBonus(PurchaseItem item) {
    final totalUnits = item.quantity + item.bonus;
    if (totalUnits == 0) return 0;
    return (item.cost * item.quantity) / totalUnits;
  }

  List<PurchaseItem> get items => List.unmodifiable(_items);
}
