import 'package:crm_app/app/features/common/functions/go_back.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/extensions/l10n_ext.dart';
import 'package:flutter/material.dart';

showDelConfrm({required BuildContext ctx, required void Function() action}) {
  return showDialog(
    context: ctx,
    builder: (context) => AlertDialog(
      title: Text(
        context.l10n.confirmDelete,
        style: AppTxtStl.large.copyWith(fontSize: 24, color: AppColour.white),
      ),
      constraints: BoxConstraints(minHeight: 180, minWidth: 300),
      content: Text(context.l10n.deleteConfirmationMessage),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBtn(onPress: () => goBack(context), txt: context.l10n.cancel),
            CustomBtn(onPress: action, txt: context.l10n.delete),
          ],
        ),
      ],
    ),
  );
}
