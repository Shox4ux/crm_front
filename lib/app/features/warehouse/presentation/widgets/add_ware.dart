import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_text_form.dart';
import 'package:crm_app/app/features/warehouse/presentation/bloc/warehouse_cubit/warehouse_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void showCreateWarehouseDialog({
  required BuildContext context,
  required Function() onCreate,
  required TextEditingController nameController,
  required TextEditingController addressController,
  String? Function(String?)? valid,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text('Create Warehouse'),
        content: Form(
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
                  CustomBtn(onPress: () => context.pop(), txt: 'Cancel'),
                  CustomBtn(onPress: onCreate, txt: 'Add'),
                ],
              );
            },
          ),
        ],
      );
    },
  );
}
