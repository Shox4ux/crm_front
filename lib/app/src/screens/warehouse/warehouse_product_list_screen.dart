import 'package:crm_app/app/src/data/remote/models/request/warehouse/warehouse_product_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/product/product_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/warehouse/warehouse_product_read.dart';
import 'package:crm_app/app/src/logic/logic.dart';
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
}) {
  showDialog(
    context: context,
    builder: (_) {
      ProductRead? slktdP;
      WarehouseProductStatus? slktdStatus;
      return StatefulBuilder(
        builder: (context, state) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text("Add Product"),
            content: StatefulBuilder(
              builder: (context, setState) {
                return Column(
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
              CustomBtn(
                txt: "Confirm",
                onPressed: () {
                  context.read<WarehouseCubit>().addWareProd(
                    WarehouseProductWrite(
                      warehouseId: context.read<WarehouseCubit>().getWID(),
                      productId: slktdP!.id,
                      status: slktdStatus?.index ?? 0,
                      quantity: int.tryParse(quantityCtrl.text) ?? 0,
                    ),
                  );
                  slktdP = null;
                  slktdStatus = null;
                  quantityCtrl.clear();
                  context.pop();
                },
              ),
              CustomBtn(
                txt: "Cancel",
                onPressed: () {
                  slktdP = null;
                  slktdStatus = null;
                  quantityCtrl.clear();
                  context.pop();
                },
              ),
            ],
          );
        },
      );
    },
  );
}

class WarehouseProductListScreen extends StatefulWidget {
  const WarehouseProductListScreen({super.key});

  @override
  State<WarehouseProductListScreen> createState() =>
      _WarehouseProductListScreenState();
}

class _WarehouseProductListScreenState
    extends State<WarehouseProductListScreen> {
  late TextEditingController _quantityCtrl;
  late String imagePath;
  @override
  void initState() {
    _quantityCtrl = TextEditingController();
    imagePath = "";
    context.read<ProductCubit>().getAllProduct();
    super.initState();
  }

  @override
  void dispose() {
    _quantityCtrl.dispose();
    super.dispose();
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
              onAdd: () {
                setState(() {
                  showAddWProductDialog(context, quantityCtrl: _quantityCtrl);
                });
              },
              onSearch: (val) {
                setState(() {
                  context.read<ProductCubit>().filter(val);
                });
              },
            ),

            Flexible(
              child: BlocConsumer<ProductCubit, ProductState>(
                listener: (context, state) {
                  if (state.status == ProdStatus.error) {
                    showToast(context, state.msg);
                  }
                },
                builder: (context, state) {
                  if (state.status == ProdStatus.loading) {
                    return CusProgress();
                  }

                  var list = context.watch<WarehouseCubit>().getWpList();
                  if (list.isEmpty) return NoData();
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
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
                context.read<ProductCubit>().deleteProduct(id: wp.id);
              });
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
