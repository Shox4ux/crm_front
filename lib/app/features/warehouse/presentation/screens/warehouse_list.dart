import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_search.dart';
import 'package:crm_app/app/features/common/widget/custom_title.dart';
import 'package:crm_app/app/features/warehouse/data/fake_data.dart';
import 'package:crm_app/app/features/warehouse/data/model/warehouse_create.dart';
import 'package:crm_app/app/features/warehouse/presentation/bloc/warehouse_cubit/warehouse_cubit.dart';
import 'package:crm_app/app/features/warehouse/presentation/widgets/add_ware.dart';
import 'package:crm_app/app/features/warehouse/presentation/widgets/ware_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WarehouseList extends StatefulWidget {
  const WarehouseList({super.key});

  @override
  State<WarehouseList> createState() => _WarehouseListState();
}

class _WarehouseListState extends State<WarehouseList> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _nameCtrl;
  late TextEditingController _passwCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController();
    _passwCtrl = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _passwCtrl.dispose();
    super.dispose();
  }

  void showAddWarehouseDialog() {
    showCreateWarehouseDialog(
      context: context,
      onCreate: _createWarehouse,
      nameController: _nameCtrl,
      addressController: _passwCtrl,
      valid: _validateNotEmpty,
    );
  }

  String? _validateNotEmpty(String? value, {bool isPass = false}) {
    if (value == null || value.trim().isEmpty) {
      return 'This field cannot be empty';
    }

    return null;
  }

  void _createWarehouse() {
    if (_formKey.currentState!.validate()) {
      var body = WarehouseCreate(
        name: _nameCtrl.text,
        address: _passwCtrl.text,
      );
      context.read<WarehouseCubit>().createWarehouse(body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        spacing: 30,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTitle(title: "Warehouse"),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  CustomSearch(),
                  CustomBtn(onPress: showAddWarehouseDialog, txt: "Add"),
                ],
              ),
            ],
          ),
          Flexible(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              shrinkWrap: true,
              itemCount: wareList.length,
              itemBuilder: (_, i) => WareCard(item: wareList[i]),
            ),
          ),
        ],
      ),
    );
  }
}
