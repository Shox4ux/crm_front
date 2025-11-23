enum OrderStatus {
  accepted("Accepted"),
  rejected("Rejected"),
  paid("Paid"),
  unpaid("Unpaid");

  static OrderStatus fromInt(int value) {
    switch (value) {
      case 0:
        return OrderStatus.accepted;
      case 1:
        return OrderStatus.rejected;
      case 2:
        return OrderStatus.paid;
      case 3:
        return OrderStatus.unpaid;

      default:
        throw Exception("Unknown user type: $value");
    }
  }

  int toInt() {
    switch (this) {
      case OrderStatus.accepted:
        return 0;
      case OrderStatus.rejected:
        return 1;
      case OrderStatus.paid:
        return 2;
      case OrderStatus.unpaid:
        return 3;
    }
  }

  final String value;
  const OrderStatus(this.value);
}
