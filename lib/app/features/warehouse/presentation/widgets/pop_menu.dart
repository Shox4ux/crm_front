import 'package:crm_app/app/features/common/functions/del_confrm.dart';
import 'package:crm_app/app/features/common/functions/go_back.dart';
import 'package:crm_app/app/features/warehouse/data/model/warehouse_create.dart';
import 'package:crm_app/app/features/warehouse/domain/entity/warehouse_entity.dart';
import 'package:crm_app/app/features/warehouse/presentation/bloc/warehouse_cubit/warehouse_cubit.dart';
import 'package:crm_app/app/features/warehouse/presentation/widgets/add_edit_ware.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

enum MenuAction { edit, delete }

class CustomMenu extends StatefulWidget {
  const CustomMenu({super.key, required this.data});

  final WarehouseEntity data;

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  late TextEditingController _nameCtrl;
  late TextEditingController _addressCtrl;
  late GlobalKey<FormState>? _formKey;

  @override
  void initState() {
    _nameCtrl = TextEditingController();
    _addressCtrl = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _addressCtrl.dispose();
    super.dispose();
  }

  String? _validateNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field cannot be empty';
    }

    return null;
  }

  void _editWarehouse() {
    if (_formKey!.currentState!.validate()) {
      // var body = WarehouseCreate(
      //   name: _nameCtrl.text.trim(),
      //   address: _addressCtrl.text.trim(),
      // );
      // context.read<WarehouseCubit>();
      goBack(context);
    }
  }

  void _deleteWarehouse() {
    if (mounted) {
      context.read<WarehouseCubit>().deleteWarehouse(widget.data.id);
      context.pop();
    }
  }

  void showEdit() {
    _nameCtrl.text = widget.data.name;
    _addressCtrl.text = widget.data.address;
    addEditWarehouseDialog(
      ctx: context,
      action: _editWarehouse,
      nameController: _nameCtrl,
      addressController: _addressCtrl,
      valid: _validateNotEmpty,
      key: _formKey,
      isEdit: true,
      title: 'Edit Warehouse',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      right: 5,
      child: Material(
        color: Colors.transparent, // REQUIRED
        child: PopupMenuButton<MenuAction>(
          position: PopupMenuPosition.over,
          icon: const Icon(Icons.menu, size: 20),
          onSelected: (value) {
            switch (value) {
              case MenuAction.edit:
                showEdit();
                break;
              case MenuAction.delete:
                showDelConfrm(ctx: context, action: _deleteWarehouse);
                break;
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: MenuAction.edit,
              child: Row(
                children: [
                  Icon(Icons.edit, size: 18),
                  SizedBox(width: 8),
                  Text('Edit'),
                ],
              ),
            ),
            PopupMenuItem(
              value: MenuAction.delete,
              child: Row(
                children: [
                  Icon(Icons.delete, size: 18, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Delete'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
