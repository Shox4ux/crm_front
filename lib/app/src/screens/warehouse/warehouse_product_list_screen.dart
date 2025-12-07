import 'package:crm_app/app/new/common/widget/custom_progress.dart';
import 'package:crm_app/app/new/common/widget/custon_no_data.dart';
import 'package:crm_app/app/src/data/remote/models/request/warehouse/warehouse_product_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/product/product_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/warehouse/warehouse_product_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/warehouse/warehouse_read.dart';
import 'package:crm_app/app/src/logic/logic.dart';
import 'package:crm_app/app/src/logic/ware_prod_cubit/ware_prod_cubit.dart';
import 'package:crm_app/app/utils/enums/warehouse_product_status.dart';
import 'package:crm_app/app/utils/extensions/full_url.dart';
import 'package:crm_app/app/utils/funcs/del_confrm.dart';
import 'package:crm_app/app/utils/funcs/show_toast.dart';
import 'package:crm_app/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

showAddWProductDialog(
  BuildContext context, {
  required TextEditingController quantityCtrl,
  required int wId,
}) {
  showDialog(
    context: context,
    builder: (_) {
      ProductRead? slktdP;
      WarehouseProductStatus? slktdStatus;

      void onCancel() {
        slktdP = null;
        slktdStatus = null;
        quantityCtrl.clear();
        context.pop();
      }

      void onAdd() {
        context.read<WareProdCubit>().addWareProd(
          WarehouseProductWrite(
            warehouseId: wId,
            productId: slktdP!.id,
            status: slktdStatus?.index ?? 0,
            quantity: int.tryParse(quantityCtrl.text) ?? 0,
          ),
        );
        onCancel();
      }

      return StatefulBuilder(
        builder: (context, state) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text("Add Product"),
            content: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProductDrop(
                      selectedVal: slktdP,
                      onChanged: (val) {
                        setState(() {
                          slktdP = val;
                        });
                      },
                      list: context.read<ProductCubit>().state.list,
                    ),
                    WarehouseProdStatusDrop(
                      slctdVal: slktdStatus,
                      onChanged: (val) {
                        setState(() {
                          slktdStatus = val;
                        });
                      },
                    ),
                    CustomDoubleText(
                      ttl: "Available Quantity: ",
                      b: slktdP?.active_quantity.toString() ?? "0",
                    ),
                    CustomField(
                      isDense: false,
                      ctrl: quantityCtrl,
                      hint: "Quantity",
                      width: 250,
                      height: 60,
                    ),
                  ],
                );
              },
            ),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: [
              CustomBtn(txt: "Confirm", onPressed: onAdd),
              CustomBtn(txt: "Cancel", onPressed: onCancel),
            ],
          );
        },
      );
    },
  );
}

class WarehouseProductListScreen extends StatefulWidget {
  const WarehouseProductListScreen({super.key, this.warehouse});
  final WarehouseRead? warehouse;

  @override
  State<WarehouseProductListScreen> createState() =>
      _WarehouseProductListScreenState();
}

class _WarehouseProductListScreenState
    extends State<WarehouseProductListScreen> {
  late TextEditingController _quantityCtrl;
  late String imagePath;

  void setUp() {
    _quantityCtrl = TextEditingController();
    imagePath = "";
    if (widget.warehouse != null) {
      context.read<WareProdCubit>().getAllWareProdByWareId(
        widget.warehouse!.id,
      );
    }
    context.read<ProductCubit>().getAllProduct();
  }

  @override
  void initState() {
    setUp();
    super.initState();
  }

  @override
  void dispose() {
    _quantityCtrl.dispose();
    super.dispose();
  }

  void onSearch(String? val) {
    setState(() {
      context.read<WareProdCubit>().filter(val);
    });
  }

  void onAdd() {
    showAddWProductDialog(
      context,
      quantityCtrl: _quantityCtrl,
      wId: widget.warehouse!.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Warehouse Products")),
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            CustomSearchAdd(
              btnTxt: "Add Product",
              onAdd: onAdd,
              onSearch: onSearch,
            ),

            Flexible(
              child: BlocConsumer<WareProdCubit, WareProdState>(
                listener: (context, state) {
                  if (state.status == ProdStatus.error) {
                    showToast(context, state.msg);
                  }
                },
                builder: (context, state) {
                  if (state.status == ProdStatus.loading) {
                    return CustomProgress();
                  }

                  var list = context.watch<WareProdCubit>().getFiltList();
                  if (list.isEmpty) return NoData();
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                        ),
                    itemCount: list.length,
                    itemBuilder: (_, int i) => WPCard(wp: list[i]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WPCard extends StatelessWidget {
  const WPCard({super.key, required this.wp});
  final WarehouseProductRead wp;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.only(right: 20, bottom: 20),
          clipBehavior: Clip.hardEdge,

          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                errorBuilder: (context, error, stackTrace) => OnImgError(),
                wp.product?.imgUrl.fullUrl() ?? "",
                width: double.maxFinite,
                height: 160,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDoubleText(ttl: "Name: ", b: wp.product?.name ?? ""),
                    CustomDoubleText(
                      ttl: "Buy Price: ",
                      b: wp.product?.basePrice.toString() ?? "",
                    ),
                    CustomDoubleText(
                      ttl: "Sell Price: ",
                      b: wp.product?.sellPrice.toString() ?? "",
                    ),
                    CustomDoubleText(
                      ttl: "Quantity: ",
                      b: wp.quantity.toString(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 20,
          child: IconButton(
            onPressed: () {
              showDelConfrm(context, () {
                context.pop();
                context.read<WareProdCubit>().delWareProd(wp.id);
              });
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
