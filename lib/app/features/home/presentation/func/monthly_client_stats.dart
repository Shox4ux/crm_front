void monthlyClientStats() {
  double janClients = 100;
  double febClients = 110;

  double percent = calculatePercentChange(janClients, febClients);

  print(percent); // 10.0
}

Map<String, dynamic> getMonthlyChange(double previous, double current) {
  double percentage = 0;

  if (previous == 0) {
    percentage = current == 0 ? 0 : 100;
  } else {
    percentage = ((current - previous) / previous) * 100;
  }

  bool isIncreased = current > previous;

  return {
    "percentage": percentage.abs(), // always positive number
    "isIncreased": isIncreased,
  };
}

double calculatePercentChange(double previous, double current) {
  if (previous == 0) {
    return current == 0 ? 0 : 100; // avoid division by zero
  }
  return ((current - previous) / previous) * 100;
}
