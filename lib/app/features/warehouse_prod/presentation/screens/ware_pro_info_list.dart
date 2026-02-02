import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_footer.dart';
import 'package:crm_app/app/features/common/widget/custom_search.dart';
import 'package:crm_app/app/features/order/presentation/widget/custom_filter.dart';
import 'package:crm_app/app/features/warehouse_prod/domain/entity/ware_pro_entitiy.dart';
import 'package:crm_app/app/features/warehouse_prod/presentation/bloc/ware_pro_cubit.dart';
import 'package:crm_app/app/features/warehouse_prod/presentation/widget/ware_pro_info_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WareProInfoList extends StatefulWidget {
  const WareProInfoList({super.key});

  @override
  State<WareProInfoList> createState() => _WareProInfoListState();
}

class _WareProInfoListState extends State<WareProInfoList> {
  final colist = [
    "number",
    "product name",
    "warehouse",
    "actual qty",
    "warehouse qty",
    "price",
    "status",
    "actions",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomFilter(onFilterPressed: filterPressed, isWarePro: true),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  CustomSearch(
                    onChanged: (val) {
                      setState(() {});
                    },
                  ),
                  CustomBtn(onPress: () {}, txt: "Add"),
                ],
              ),
            ],
          ),
          Expanded(
            child: BlocConsumer<WareProCubit, WareProState>(
              listener: (context, state) {
                // if (state.status == OrderStatus.error ||
                //     state.status == OrderStatus.success) {
                //   showToast(context, state.msg ?? "");
                // }
              },
              builder: (context, state) {
                var list = context.watch<WareProCubit>().getAllFiltList();
                // var orderList = context.watch<OrderCubit>().getFiltList();
                // if (state.status == OrderStatus.loading) {
                //   return const CustomLoading();
                // }
                // if (state.status == OrderStatus.empty) {
                //   return const NoData();
                // }
                return SingleChildScrollView(
                  child: WareProInfoTable(
                    clms: colist,
                    rows: list,
                    delAction: deleteOrder,
                    editAction: editOrder,
                  ),
                );
              },
            ),
          ),
          CustomFooter(
            totalCount: 12,
            pageCount: 12,
            onLeftPressed: () {},
            onRightPressed: () {},
          ),
        ],
      ),
    );
  }

  void filterPressed() {}

  void deleteOrder(WareProEntity order) {}

  void editOrder(WareProEntity order) {}
}
