String profitPrc(double buyPrice, double sellPrice) {
  double percent = ((sellPrice - buyPrice) / buyPrice) * 100;
  return percent.toStringAsFixed(2);
}
