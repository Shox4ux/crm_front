import 'package:flutter/widgets.dart';
import 'package:crm_app/app/features/common/extensions/l10n_ext.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';

enum OrderFilterStatus {
  all(color: AppColour.textDark),
  paid(color: AppColour.completedDark),
  prepaid(color: AppColour.onholdDark),
  unpaid(color: AppColour.rejectedDark);

  final Color color;
  const OrderFilterStatus({required this.color});

  String localizedName(BuildContext context) {
    switch (this) {
      case OrderFilterStatus.all:
        return context.l10n.all;
      case OrderFilterStatus.paid:
        return context.l10n.paidOrder;
      case OrderFilterStatus.prepaid:
        return context.l10n.prepaidOrder;
      case OrderFilterStatus.unpaid:
        return context.l10n.unpaidOrder;
    }
  }
}

enum OrderEnumStatus {
  paid(color: AppColour.completedDark),
  prepaid(color: AppColour.onholdDark),
  unpaid(color: AppColour.rejectedDark);

  final Color color;
  const OrderEnumStatus({required this.color});

  String localizedName(BuildContext context) {
    switch (this) {
      case OrderEnumStatus.paid:
        return context.l10n.paidOrder;
      case OrderEnumStatus.prepaid:
        return context.l10n.prepaidOrder;
      case OrderEnumStatus.unpaid:
        return context.l10n.unpaidOrder;
    }
  }
}

OrderEnumStatus orderStatusFromInt(int value) {
  switch (value) {
    case 0:
      return OrderEnumStatus.paid;
    case 1:
      return OrderEnumStatus.prepaid;
    case 2:
      return OrderEnumStatus.unpaid;
    default:
      return OrderEnumStatus.paid;
  }
}

int orderStatusToInt(OrderEnumStatus status) {
  return status.index;
}
