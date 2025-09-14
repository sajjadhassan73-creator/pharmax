// lib/screens/purchases/widgets/purchase_table_helpers.dart
//
// دوال مساعدة لحساب الكلفة/السعر/الربح الخاصة بجدول المشتريات.

import '../../../models/purchase_item.dart';
import '../../../models/product_model.dart';

/// دوال حسابية للجدول
class PurchaseTableHelpers {
  /// يعيد كلفة الوحدة المطلوبة
  static double unitCost(ProductModel p, String unit) {
    if (unit == p.unit) return p.primaryCost;
    if (unit == p.secondaryUnitName) {
      if (p.secondaryCost != null) return p.secondaryCost!;
      final pk = (p.packing == 0) ? 1 : p.packing;
      return p.primaryCost / pk;
    }
    return p.primaryCost;
  }

  /// يعيد سعر الوحدة المطلوبة
  static double unitPrice(ProductModel p, String unit) {
    if (unit == p.unit) return p.primaryPrice;
    if (unit == p.secondaryUnitName) {
      if (p.secondaryPrice != null) return p.secondaryPrice!;
      final pk = (p.packing == 0) ? 1 : p.packing;
      return p.primaryPrice / pk;
    }
    return p.primaryPrice;
  }

  /// الكلفة بعد البونص (لكل وحدة)
  static double costAfterBonus(PurchaseItem it) {
    final totalUnits = it.quantity + it.bonus;
    if (totalUnits <= 0) return 0;
    return (it.cost * it.quantity) / totalUnits;
  }

  /// احتساب السعر من (كلفة/نسبة/بونص/كمية)
  /// تستخدم لما تغير الكلفة أو النسبة وتريد تحسب سعر جديد
  static double priceFrom(
    PurchaseItem it, {
    double? profitPct,
    double? cost,
    int? qty,
    int? bonus,
  }) {
    final q = (qty ?? it.quantity).clamp(0, 999999);
    final c = (cost ?? it.cost).clamp(0, double.infinity);
    final b = (bonus ?? it.bonus).clamp(0, 999999);
    final p = profitPct ?? it.profitPercentage;

    final cab = b > 0 ? (c * q) / (q + b) : c;
    final price = cab + (cab * p / 100);
    return price.roundToDouble(); // 🔵 يرجع صحيح
  }

  /// استرجاع نسبة الربح من سعر جديد
  static double profitFromPrice(PurchaseItem it, double newPrice) {
    final cab = costAfterBonus(it);
    if (cab <= 0) return 0;
    final profit = ((newPrice - cab) / cab) * 100;
    return profit.roundToDouble(); // 🔵 يرجع صحيح
  }

  /// قائمة الوحدات الممكنة
  static List<String> unitOptions(ProductModel prod, String currentUnit) {
    final set = <String>{};
    set.add(prod.unit);
    if (prod.secondaryUnitName != null &&
        prod.secondaryUnitName!.trim().isNotEmpty) {
      set.add(prod.secondaryUnitName!);
    }
    if (set.isEmpty) set.add(currentUnit);
    return set.toList();
  }

  /// ✅ دالة موحّدة لإعادة حساب الحقول
  static PurchaseItem recalc(
    PurchaseItem it, {
    double? newCost,
    int? newQty,
    int? newBonus,
    double? newProfit,
    double? newPrice,
    ProductModel? product,
  }) {
    final qty = newQty ?? it.quantity;
    final cost = newCost ?? it.cost;
    final bonus = newBonus ?? it.bonus;

    // الكلفة بعد البونص
    final cab = (qty + bonus) > 0 ? (cost * qty) / (qty + bonus) : cost;

    double price1;
    double profit;

    if (newProfit != null) {
      // المستخدم عدل النسبة → نحسب السعر
      profit = newProfit;
      price1 = cab + (cab * profit / 100);
    } else if (newPrice != null) {
      // المستخدم عدل السعر → نحسب النسبة
      price1 = newPrice;
      profit = cab > 0 ? ((price1 - cab) / cab) * 100 : it.profitPercentage;
    } else {
      price1 = it.price;
      profit = it.profitPercentage;
    }

    // السعر 2 للوحدة الثانوية
    double? price2;
    if (product != null &&
        product.secondaryUnitName != null &&
        product.packing > 1) {
      price2 = price1 / product.packing;
    }

    return it.copyWith(
      cost: cost,
      quantity: qty,
      bonus: bonus,
      profitPercentage: profit.roundToDouble(),
      price: price1.roundToDouble(),
      price2: price2?.roundToDouble(),
    );
  }
}
