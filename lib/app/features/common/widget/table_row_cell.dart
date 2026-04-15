import 'package:crm_app/app/features/common/extensions/l10n_ext.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/order/presentation/utils/order_enum_status.dart';
import 'package:crm_app/app/features/order/presentation/utils/order_list_view_enum.dart';
import 'package:flutter/material.dart';

class RowCell extends StatelessWidget {
  const RowCell({
    super.key,
    this.txt = "",
    this.status,
    this.viewEnum = OrderListViewEnum.text,
    this.delAction,
    this.isCancel = false,
    this.isOrder = false,
    this.editAction,
  });
  final String txt;
  final OrderEnumStatus? status;
  final OrderListViewEnum viewEnum;

  final bool isCancel;
  final bool isOrder;

  final void Function()? delAction;
  final void Function()? editAction;

  @override
  Widget build(BuildContext context) {
    switch (viewEnum) {
      case OrderListViewEnum.action:
        return Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              IconButton(
                onPressed: editAction,
                icon: Icon(Icons.edit, color: Colors.blue),
              ),
              isCancel
                  ? SizedBox.shrink()
                  : IconButton(
                      onPressed: delAction,
                      icon: Icon(
                        isOrder ? Icons.cancel : Icons.delete,
                        color: Colors.red,
                      ),
                    ),
            ],
          ),
        );
      case OrderListViewEnum.status:
        final statusText = _getLocalizedStatus(context, status);
        return Flexible(
          child: Center(
            child: Container(
              alignment: Alignment.center,
              width: 140,
              decoration: BoxDecoration(
                color: status?.color,
                borderRadius: AppRadius.buttonRadius,
              ),
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              child: Text(
                statusText.toUpperCase(),
                style: AppTxtStl.medium.copyWith(color: AppColour.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      case OrderListViewEnum.text:
        return Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              txt,
              style: AppTxtStl.medium,
              textAlign: TextAlign.center,
            ),
          ),
        );
      case OrderListViewEnum.debt:
        return Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              txt,
              style: AppTxtStl.medium.copyWith(color: AppColour.rejectedDark),
              textAlign: TextAlign.center,
            ),
          ),
        );
    }
  }

  String _getLocalizedStatus(BuildContext context, OrderEnumStatus? status) {
    switch (status) {
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
      default:
        return "";
    }
  }
}
