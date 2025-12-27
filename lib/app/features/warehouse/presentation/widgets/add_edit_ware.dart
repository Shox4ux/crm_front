import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_text_form.dart';
import 'package:crm_app/app/features/warehouse/presentation/bloc/warehouse_cubit/warehouse_cubit.dart';
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
  String title = 'Create Warehouse',
  bool isEdit = false,
}) {
  showDialog(
    context: ctx,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text(title, style: TextStyle(color: AppColour.backgroundLight)),
        content: Form(
          key: key,
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomForm(ctrl: nameController, txt: 'Name', valid: valid),
              CustomForm(ctrl: addressController, txt: 'Address', valid: valid),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomBtn(onPress: action, txt: isEdit ? 'Update' : 'Add'),
                  CustomBtn(onPress: () => goBack(context), txt: 'Cancel'),
                ],
              );
            },
          ),
        ],
      );
    },
  );
}
