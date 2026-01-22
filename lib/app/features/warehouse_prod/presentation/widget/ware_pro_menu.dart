import 'package:crm_app/app/features/common/functions/del_confrm.dart';
import 'package:crm_app/app/features/common/functions/go_back.dart';
import 'package:crm_app/app/features/product/domain/entity/product_entity.dart';
import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_create.dart';
import 'package:crm_app/app/features/warehouse_prod/domain/entity/ware_pro_entitiy.dart';
import 'package:crm_app/app/features/warehouse_prod/presentation/bloc/ware_pro_cubit.dart';
import 'package:crm_app/app/features/warehouse_prod/presentation/widget/add_edit_ware_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MenuAction { edit, delete }

class WareProMenu extends StatefulWidget {
  const WareProMenu({super.key, required this.data, this.prodList});
  final List<ProductEntity>? prodList;
  final WareProEntity data;

  @override
  State<WareProMenu> createState() => _WareProMenuState();
}

class _WareProMenuState extends State<WareProMenu> {
  late GlobalKey<FormState>? _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  void _editWarePro(WareProCreate data) {
    if (_formKey!.currentState!.validate()) {
      context.read<WareProCubit>();
      goBack(context);
    }
  }

  void _deleteWarePro() {
    if (mounted) {
      context.read<WareProCubit>().delWareProd(widget.data);
      goBack(context);
    }
  }

  void showEdit() {
    showWareProductDialog(
      wareId: widget.data.warehouseId,
      key: _formKey,
      context,
      prodList: widget.prodList,
      action: _editWarePro,
      editData: widget.data,
      isEdit: true,
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
                showDelConfrm(ctx: context, action: _deleteWarePro);
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
