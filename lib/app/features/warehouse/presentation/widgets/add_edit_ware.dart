import 'package:crm_app/actions/action_widgets/enter_action.dart';
import 'package:crm_app/app/features/common/extensions/l10n_ext.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_text_form.dart';
import 'package:crm_app/app/features/common/widget/dialog_title.dart';
import 'package:crm_app/app/features/warehouse/presentation/bloc/warehouse_cubit.dart';
import 'package:crm_app/app/features/common/functions/go_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void addEditWarehouseDialog({
  required BuildContext ctx,
  required Function() action,
  required TextEditingController nameController,
  required TextEditingController addressController,
  GlobalKey? key,
  String? Function(String?)? valid,
  String? title,
  bool isEdit = false,
}) {
  final dialogTitle =
      title ?? (isEdit ? ctx.l10n.editWarehouse : ctx.l10n.createWarehouse);
  showDialog(
    context: ctx,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: DialogTitle(title: dialogTitle),
        content: Form(
          key: key,
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomForm(
                ctrl: nameController,
                txt: context.l10n.name,
                valid: valid,
              ),
              CustomForm(
                ctrl: addressController,
                txt: context.l10n.address,
                valid: valid,
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
                  EnterAction(
                    onEnter: action,
                    child: CustomBtn(
                      onPress: action,
                      txt: isEdit ? context.l10n.edit : context.l10n.add,
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
}
