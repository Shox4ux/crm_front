enum OrderCancelType { cancel, refund }

OrderCancelType typeFromInt(int i) {
  switch (i) {
    case 0:
      return OrderCancelType.cancel;
    case 1:
      return OrderCancelType.refund;
    default:
      return OrderCancelType.cancel;
  }
}

int typeToInt(OrderCancelType type) {
  switch (type) {
    case OrderCancelType.cancel:
      return 0;
    case OrderCancelType.refund:
      return 1;
  }
}
