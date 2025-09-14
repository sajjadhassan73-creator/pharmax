class PriceUtils {
  /// حساب الكلفة بعد البونص
  static double costAfterBonus(double cost, int quantity, int bonus) {
    if (bonus > 0) {
      return (cost * quantity) / (quantity + bonus);
    }
    return cost;
  }

  /// حساب سعر البيع بعد إضافة نسبة الربح على الكلفة بعد البونص
  static double calculatePrice(double costAfterBonus, double profitPercentage) {
    return costAfterBonus + (costAfterBonus * profitPercentage / 100);
  }

  /// حساب مجموع الكلفة الإجمالية لعناصر الفاتورة
  static double totalCost(List items) {
    return items.fold(0.0, (sum, item) => sum + (item.cost * item.quantity));
  }

  /// حساب مجموع السعر المتوقع للبيع من الفاتورة
  static double totalPrice(List items) {
    return items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  /// تطبيق الخصم (نسبة أو مبلغ)
  static double applyDiscount(
      double total, String type, double discountValue) {
    if (type == 'نسبة') {
      return total - (total * discountValue / 100);
    } else {
      return total - discountValue;
    }
  }
}
