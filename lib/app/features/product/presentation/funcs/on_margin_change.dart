String onProfitChanged(String? value, String basePriceStr) {
  final profit = double.tryParse(value ?? "");
  final basePrice = double.tryParse(basePriceStr) ?? 0;
  if (profit == null) return "0.00";
  final sellPrice = basePrice + (basePrice * profit / 100);
  return sellPrice.toStringAsFixed(2);
}
