import 'package:crm_app/app/new/common/widget/custom_progress.dart';
import 'package:crm_app/app/new/common/widget/custon_no_data.dart';
import 'package:crm_app/app/src/data/remote/models/request/warehouse/warehouse_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/warehouse/warehouse_read.dart';
import 'package:crm_app/app/src/logic/logic.dart';
import 'package:crm_app/app/utils/funcs/del_confrm.dart';
import 'package:crm_app/app/utils/funcs/show_toast.dart';
import 'package:crm_app/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WarehouseScreen extends StatefulWidget {
  const WarehouseScreen({super.key});

  @override
  State<WarehouseScreen> createState() => _WarehouseScreenState();
}

class _WarehouseScreenState extends State<WarehouseScreen> {
  late TextEditingController _nameCtrl;
  late TextEditingController _addressCtrl;

  @override
  void initState() {
    _nameCtrl = TextEditingController();
    _addressCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _addressCtrl.dispose();

    super.dispose();
  }

  void onSearch(String? val) {
    setState(() {
      context.read<WarehouseCubit>().filter(val);
    });
  }

  void onAdd() {
    showAddWare(context, _nameCtrl, _addressCtrl);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        spacing: 20,
        children: [
          CustomSearchAdd(btnTxt: "Add Ware", onSearch: onSearch, onAdd: onAdd),
          Flexible(
            child: BlocConsumer<WarehouseCubit, WarehouseState>(
              listener: (context, state) {
                if (state.status == WareStatus.failure) {
                  showToast(context, state.msg ?? "");
                }
              },
              builder: (context, state) {
                if (state.status == WareStatus.loading) {
                  return CustomProgress();
                }
                var list = context.watch<WarehouseCubit>().getFiltList();
                if (list.isEmpty) return NoData();
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                  ),
                  itemCount: list.length,
                  itemBuilder: (_, int i) => WarehouseCard(warehouse: list[i]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void showAddWare(
  BuildContext c,
  TextEditingController nameCtrl,
  TextEditingController addressCtrl,
) {
  showDialog(
    context: c,
    barrierDismissible: false, // user must tap Confirm or Cancel
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Center(child: const Text('Enter Details')),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomField(
              isDense: false,
              ctrl: nameCtrl,
              hint: "Name",
              width: 300,
              height: 60,
            ),
            CustomField(
              isDense: false,
              ctrl: addressCtrl,
              hint: "Address",
              width: 300,
              height: 60,
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          CustomBtn(
            txt: 'Confirm',
            width: 120,

            onPressed: () {
              context.read<WarehouseCubit>().createWarehouse(
                WarehouseWrite(name: nameCtrl.text, address: addressCtrl.text),
              );
              nameCtrl.clear();
              addressCtrl.clear();
              context.pop();
            },
          ),
          CustomBtn(
            txt: 'Cancel',
            width: 120,
            onPressed: () {
              nameCtrl.clear();
              addressCtrl.clear();
              context.pop();
            },
          ),
        ],
      );
    },
  );
}

class WarehouseCard extends StatelessWidget {
  const WarehouseCard({super.key, required this.warehouse});
  final WarehouseRead warehouse;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),

      child: Stack(
        children: [
          InkWell(
            onTap: () {
              context.read<WarehouseCubit>().onWPessed(warehouse.id);
              context.push("/warehouse_products", extra: warehouse);
            },
            child: Card(
              color: Colors.white,
              elevation: 8,

              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text(warehouse.name), Text(warehouse.address)],
                ),
              ),
            ),
          ),
          Positioned(
            right: 5,
            child: IconButton(
              onPressed: () {
                showDelConfrm(context, () {
                  context.read<WarehouseCubit>().deleteWarehouse(warehouse.id);
                  context.pop();
                });
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
