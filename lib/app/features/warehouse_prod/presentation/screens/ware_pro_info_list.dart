import 'package:crm_app/app/features/common/extensions/l10n_ext.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_footer.dart';
import 'package:crm_app/app/features/common/widget/custom_progress.dart';
import 'package:crm_app/app/features/common/widget/custom_search.dart';
import 'package:crm_app/app/features/common/widget/custon_no_data.dart';
import 'package:crm_app/app/features/common/widget/custom_filter.dart';
import 'package:crm_app/app/features/common/widget/refresher_widget.dart';
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
  @override
  void initState() {
    super.initState();
    context.read<WareProCubit>().getAllWareProd();
  }

  @override
  Widget build(BuildContext context) {
    final colist = [
      context.l10n.number,
      context.l10n.productName,
      context.l10n.warehouse,
      context.l10n.actualQty,
      context.l10n.warehouseQty,
      context.l10n.price,
      context.l10n.status,
      context.l10n.action,
    ];
    return RefresherWidget(
      bottom: 100,
      right: 40,
      onRefresh: () {
        context.read<WareProCubit>().getAllWareProd();
      },
      child: Padding(
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
                    CustomBtn(onPress: () {}, txt: context.l10n.add),
                  ],
                ),
              ],
            ),
            Expanded(
              child: BlocConsumer<WareProCubit, WareProState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var list = context.watch<WareProCubit>().getAllFiltList();
                  if (state.status == WareProStatus.loading) {
                    return const CustomLoading();
                  }
                  if (state.status == WareProStatus.allempty ||
                      state.status == WareProStatus.empty ||
                      state.status == WareProStatus.error) {
                    return const NoData();
                  }
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
      ),
    );
  }

  void filterPressed() {}

  void deleteOrder(WareProEntity order) {}

  void editOrder(WareProEntity order) {}
}
