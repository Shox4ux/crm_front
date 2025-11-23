enum OrderTabStatus {
  all(val: -1),
  accepted(val: 0),
  rejected(val: 1),
  paid(val: 2),
  unpaid(val: 4);

  final int val;
  const OrderTabStatus({required this.val});
}
