String onSellPriceChanged(String? value, String basePriceStr) {
  final sellPrice = double.tryParse(value ?? "");
  final basePrice = double.tryParse(basePriceStr) ?? 0;
  if (sellPrice == null || basePrice == 0) return "0.00";
  final profit = ((sellPrice - basePrice) / basePrice) * 100;
  return profit.toStringAsFixed(0);
}
