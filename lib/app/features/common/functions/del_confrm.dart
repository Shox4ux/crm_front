import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
// import 'package:crm_app/app/utils/utils.dart';
import 'package:flutter/material.dart';

showDelConfrm({required BuildContext ctx, required void Function() onDel}) {
  return showDialog<bool>(
    context: ctx,
    builder: (context) => AlertDialog(
      title: Text(
        "Confirm Delete",
        style: AppTextStyle.large.copyWith(
          fontSize: 24,
          color: AppColour.white,
        ),
      ),
      constraints: BoxConstraints(minHeight: 180, minWidth: 300),
      content: Text("Are you sure to delete this item?"),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        // CusProgress(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBtn(onPress: () {}, txt: "Delete"),
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
