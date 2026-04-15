import 'package:crm_app/actions/action_widgets/enter_action.dart';
import 'package:crm_app/app/features/common/extensions/l10n_ext.dart';
import 'package:crm_app/app/features/common/functions/go_back.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_text_form.dart';
import 'package:crm_app/app/features/common/widget/dialog_title.dart';
import 'package:crm_app/app/features/order_cancel/data/model/order_cancel_create.dart';
import 'package:crm_app/app/features/order_cancel/presentation/utils/order_cancel_type.dart';
import 'package:crm_app/app/features/warehouse/presentation/bloc/warehouse_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void orderCancelDialog({
  required BuildContext ctx,
  required Function(OrderCancelCreate body) action,
  required TextEditingController reasonCtrl,
  GlobalKey<FormState>? key,
  String? Function(String?)? valid,
  String? title,
  bool isEdit = false,
}) {
  OrderCancelType? slctCancelStatus = OrderCancelType.cancel;
  final List<int> typeInts = [3, 4];

  String? validate(dynamic val) {
    if (val == null) {
      return 'Required';
    }
    if (val is String && val.isEmpty) {
      return 'Required';
    }
    return null;
  }

  void actionPress(BuildContext ctx) {
    if (key!.currentState!.validate()) {
      var b = OrderCancelCreate(
        orderId: 1,
        cancelReason: reasonCtrl.text,
        cancelType: typeToInt(slctCancelStatus!),
      );
      action(b);
      goBack(ctx);
    }
  }

  dynamic statusList() {
    return typeInts.map((intValue) {
      final type = typeFromInt(intValue);
      return DropdownMenuItem(value: type, child: Text(type.name));
    }).toList();
  }

  showDialog(
    context: ctx,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: DialogTitle(title: title ?? 'Cancel Order'),
            content: Form(
              key: key,

              child: Column(
                spacing: 12,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomForm(
                    ctrl: reasonCtrl,
                    txt: context.l10n.reason,
                    valid: valid,
                  ),
                  DropdownButtonFormField<OrderCancelType>(
                    decoration: const InputDecoration(labelText: 'Status'),
                    items: statusList(),
                    validator: validate,
                    initialValue: slctCancelStatus,
                    onChanged: (value) {
                      setState(() {
                        slctCancelStatus = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: [
              BlocBuilder<WarehouseCubit, WarehouseState>(
                builder: (context, state) {
                  if (state.status == WareStatus.loading) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  return Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBtn(
                        onPress: () => goBack(context),
                        txt: context.l10n.cancel,
                      ),
                      isEdit
                          ? SizedBox.shrink()
                          : EnterAction(
                              onEnter: () => actionPress(ctx),
                              child: CustomBtn(
                                onPress: () => actionPress(ctx),
                                txt: isEdit
                                    ? context.l10n.edit
                                    : context.l10n.add,
                              ),
                            ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      );
    },
  );
}
