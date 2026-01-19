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
  final formKey = GlobalKey<FormState>();
  String? validate(String? val) {
    if (val == null || val.isEmpty) {
      return "Please Enter Value";
    }
    return null;
  }

  return showDialog<bool>(
    context: ctx,
    builder: (context) => AlertDialog(
      title: Text(
        "$title Product Expense",
        style: AppTxtStl.large.copyWith(fontSize: 24, color: AppColour.white),
      ),
      constraints: BoxConstraints(minHeight: 180, minWidth: 300),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomForm(
              ctrl: name,
              initVal: data?['name'],
              txt: "Expense Name",
              valid: validate,
            ),
            CustomForm(
              valid: validate,
              isDigit: true,
              ctrl: amount,
              initVal: data?['amount'],
              txt: "Amount",
              prefix: "\$ ",
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBtn(
              onPress: () => Navigator.of(context).pop(),
              txt: "Cancel",
            ),
            CustomBtn(
              onPress: () {
                if (formKey.currentState!.validate()) {
                  action();
                }
              },
              txt: title,
            ),
          ],
        ),
      ],
    ),
  );
}
