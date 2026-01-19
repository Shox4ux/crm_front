import 'package:crm_app/app/features/common/functions/show_toast.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_progress.dart';
import 'package:crm_app/app/features/common/widget/custom_search.dart';
import 'package:crm_app/app/features/common/widget/custom_title.dart';
import 'package:crm_app/app/features/common/widget/custon_no_data.dart';
import 'package:crm_app/app/features/product/domain/entity/product_entity.dart';
import 'package:crm_app/app/features/product/presentation/bloc/product_cubit.dart';
import 'package:crm_app/app/features/warehouse/domain/entity/warehouse_entity.dart';
import 'package:crm_app/app/features/warehouse_prod/data/fake_data.dart';
import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_create.dart';
import 'package:crm_app/app/features/warehouse_prod/presentation/bloc/ware_pro_cubit.dart';
import 'package:crm_app/app/features/warehouse_prod/presentation/widget/add_edit_ware_pro.dart';
import 'package:crm_app/app/features/warehouse_prod/presentation/widget/ware_pro_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WarehouseProductList extends StatefulWidget {
  final WarehouseEntity? data;
  const WarehouseProductList({super.key, required this.data});

  @override
  State<WarehouseProductList> createState() => _WarehouseProductListState();
}

class _WarehouseProductListState extends State<WarehouseProductList> {
  late final WareProFake fake;
  late GlobalKey<FormState>? _formKey;
  late final List<ProductEntity> prodList;

  @override
  void initState() {
    super.initState();
    fake = WareProFake();
    context.read<WareProCubit>().getAllWareProdByWareId(widget.data!.id);
    //Requesting all products , and get the list
    context.read<ProductCubit>().getAllProduct();
    prodList = context.read<ProductCubit>().getFiltList();

    debugPrint("ProdList: ${prodList.length.toString()}");
    _formKey = GlobalKey<FormState>();
  }

  void onAdd(WareProCreate data) {
    setState(() {
      context.read<WareProCubit>().addWareProd(data);
    });
  }

  void showAddDialog() {
    showWareProductDialog(
      key: _formKey,
      prodList: prodList,
      isEdit: false,
      context,
      action: onAdd,
      wareId: widget.data?.id,
    );
  }

  void search(String? val) {
    setState(() {
      context.read<WareProCubit>().filter(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.data?.name} Warehouse")),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          spacing: 30,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTitle(title: "Products"),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    CustomSearch(onChanged: search),
                    CustomBtn(onPress: showAddDialog, txt: "Add"),
                  ],
                ),
              ],
            ),
            Flexible(
              child: BlocConsumer<WareProCubit, WareProState>(
                listener: (context, state) {
                  if (state.status == WareProStatus.error ||
                      state.status == WareProStatus.success) {
                    showToast(context, state.msg);
                  }
                },
                builder: (context, state) {
                  if (state.status == WareProStatus.loading) {
                    return CustomLoading();
                  }
                  if (state.status == WareProStatus.empty ||
                      state.status == WareProStatus.error) {
                    return NoData();
                  }
                  var list = context.watch<WareProCubit>().getFiltList();
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                    ),
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (_, i) => WareProCard(item: list[i]),
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
