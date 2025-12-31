import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_text_form.dart';
import 'package:flutter/material.dart';

addEditExpense({
  required BuildContext ctx,
  required void Function() action,
  required TextEditingController name,
  required TextEditingController amount,
  String title = "Add",
  Map<String, dynamic>? data,
  required int i,
}) {
  return showDialog<bool>(
    context: ctx,
    builder: (context) => AlertDialog(
      title: Text(
        "$title Product Expense",
        style: AppTextStyle.large.copyWith(
          fontSize: 24,
          color: AppColour.white,
        ),
      ),
      constraints: BoxConstraints(minHeight: 180, minWidth: 300),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomForm(ctrl: name, initVal: data?['name'], txt: "Expense Name"),
          CustomForm(
            ctrl: amount,
            initVal: data?['amount'],
            txt: "Amount",
            prefix: "\$",
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBtn(onPress: () => action(), txt: title),
            CustomBtn(
              onPress: () => Navigator.of(context).pop(),
              txt: "Cancel",
            ),
          ],
        ),
      ],
    ),
  );
}
