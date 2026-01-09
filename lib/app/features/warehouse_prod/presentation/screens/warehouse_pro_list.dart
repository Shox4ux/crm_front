import 'package:crm_app/app/features/common/functions/show_toast.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_progress.dart';
import 'package:crm_app/app/features/common/widget/custon_no_data.dart';
import 'package:crm_app/app/features/core/router/route_names.dart';
import 'package:crm_app/app/features/warehouse/domain/entity/warehouse_entity.dart';
import 'package:crm_app/app/features/warehouse_prod/presentation/widget/ware_pro_card.dart';
import 'package:crm_app/app/features/warehouse_prod/presentation/bloc/ware_prod_cubit/ware_prod_cubit.dart';
import 'package:crm_app/app/utils/widgets/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WarehouseProList extends StatelessWidget {
  final WarehouseEntity data;
  const WarehouseProList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${data.name} Warehouse")),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          spacing: 30,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    CustomSearch(onChanged: (v) {}),
                    CustomBtn(
                      onPress: () => context.push(Routes.productAddEdit),
                      txt: "Add",
                    ),
                  ],
                ),
              ],
            ),
            Flexible(
              child: BlocConsumer<WareProdCubit, WareProdState>(
                listener: (context, state) {
                  if (state.status == WareProdStatus.error ||
                      state.status == WareProdStatus.success) {
                    showToast(context, state.msg);
                  }
                },
                builder: (context, state) {
                  if (state.status == WareProdStatus.loading) {
                    return CustomLoading();
                  }
                  if (state.status == WareProdStatus.empty) {
                    return NoData();
                  }
                  var list = context.watch<WareProdCubit>().getFiltList();
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                    ),
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (_, i) => InkWell(
                      // onTap: () =>
                      //     context.push(Routes.productAddEdit, extra: list[i]),
                      child: WareProCard(item: list[i]),
                    ),
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
