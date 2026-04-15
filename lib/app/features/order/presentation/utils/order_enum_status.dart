import 'package:flutter/material.dart';
import 'package:crm_app/app/features/common/extensions/l10n_ext.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';

enum OrderFilterStatus {
  all(color: AppColour.textDark),
  paid(color: AppColour.completedDark),
  prepaid(color: AppColour.onholdDark),
  unpaid(color: AppColour.rejectedDark),
  canceled(color: Colors.deepOrange),
  refunded(color: Colors.deepPurple);

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
      case OrderFilterStatus.canceled:
        return context.l10n.cancelledOrder;
      case OrderFilterStatus.refunded:
        return context.l10n.refundedOrder;
    }
  }
}

enum OrderEnumStatus {
  paid(color: AppColour.completedDark),
  prepaid(color: AppColour.onholdDark),
  unpaid(color: AppColour.rejectedDark),
  canceled(color: Colors.pink),
  refunded(color: Colors.deepPurple);

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
      case OrderEnumStatus.canceled:
        return context.l10n.cancelledOrder;
      case OrderEnumStatus.refunded:
        return context.l10n.refundedOrder;
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
    case 3:
      return OrderEnumStatus.canceled;
    case 4:
      return OrderEnumStatus.refunded;
    default:
      return OrderEnumStatus.paid;
  }
}

int orderStatusToInt(OrderEnumStatus status) {
  return status.index;
}
