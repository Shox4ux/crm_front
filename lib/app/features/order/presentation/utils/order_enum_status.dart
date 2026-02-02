import 'dart:ui';

import 'package:crm_app/app/features/common/ui/app_colour.dart';

enum OrderFilterStatus {
  all(color: AppColour.textDark),
  paid(color: AppColour.completedDark),
  unpaid(color: AppColour.rejectedDark);

  final Color color;
  const OrderFilterStatus({required this.color});
}

enum OrderEnumStatus {
  paid(color: AppColour.completedDark),
  unpaid(color: AppColour.rejectedDark);

  final Color color;
  const OrderEnumStatus({required this.color});
}

OrderEnumStatus orderStatusFromInt(int value) {
  switch (value) {
    case 0:
      return OrderEnumStatus.paid;
    case 1:
      return OrderEnumStatus.unpaid;
    default:
      return OrderEnumStatus.paid;
  }
}

int orderStatusToInt(OrderEnumStatus status) {
  return status.index;
}
