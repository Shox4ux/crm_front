enum OrderCancelType { cancel, refund }

OrderCancelType typeFromInt(int i) {
  switch (i) {
    case 3:
      return OrderCancelType.cancel;
    case 4:
      return OrderCancelType.refund;
    default:
      return OrderCancelType.cancel;
  }
}

int typeToInt(OrderCancelType type) {
  switch (type) {
    case OrderCancelType.cancel:
      return 3;
    case OrderCancelType.refund:
      return 4;
  }
}
