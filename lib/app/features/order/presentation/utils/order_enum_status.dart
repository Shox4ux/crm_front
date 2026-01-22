import 'dart:ui';

import 'package:crm_app/app/features/common/ui/app_colour.dart';

enum OrderEnumStatus {
  processing(color: AppColour.inprocessDark),
  onhold(color: AppColour.onholdDark),
  completed(color: AppColour.completedDark),
  rejected(color: AppColour.rejectedDark);

  final Color color;
  const OrderEnumStatus({required this.color});
}

OrderEnumStatus orderStatusFromInt(int value) {
  switch (value) {
    case 0:
      return OrderEnumStatus.processing;
    case 1:
      return OrderEnumStatus.onhold;
    case 2:
      return OrderEnumStatus.completed;
    case 3:
      return OrderEnumStatus.rejected;
    default:
      return OrderEnumStatus.processing; // safe fallback
  }
}

int orderStatusToInt(OrderEnumStatus status) {
  return status.index;
}
