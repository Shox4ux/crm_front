import 'package:crm_app/app/features/common/extensions/l10n_ext.dart';
import 'package:crm_app/app/features/common/functions/del_confrm.dart';
import 'package:crm_app/app/features/common/functions/go_back.dart';
import 'package:crm_app/app/features/common/functions/show_toast.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_footer.dart';
import 'package:crm_app/app/features/common/widget/custom_progress.dart';
import 'package:crm_app/app/features/common/widget/custom_search.dart';
import 'package:crm_app/app/features/common/widget/custon_no_data.dart';
import 'package:crm_app/app/features/common/widget/refresher_widget.dart';
import 'package:crm_app/app/features/core/router/route_names.dart';
import 'package:crm_app/app/features/order/domain/entity/order_entity.dart';
import 'package:crm_app/app/features/order/presentation/bloc/order_cubit.dart';
import 'package:crm_app/app/features/common/widget/custom_filter.dart';
import 'package:crm_app/app/features/order/presentation/widget/order_custom_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  String query = "";
  @override
  void initState() {
    super.initState();
    context.read<OrderCubit>();
  }

  void deleteOrder(OrderEntity order) {
    showDelConfrm(
      ctx: context,
      action: () {
        context.read<OrderCubit>().deleteOrder(id: order.id);
        goBack(context);
      },
    );
  }

  void editOrder(OrderEntity order) {
    context.push(Routes.orderAddEdit, extra: order);
  }

  void filterPressed() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefresherWidget(
      bottom: 100,
      right: 40,
      onRefresh: () {
        context.read<OrderCubit>().getAllOrders();
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
                CustomFilter(onFilterPressed: filterPressed),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    CustomSearch(
                      onChanged: (val) {
                        setState(() {
                          context.read<OrderCubit>().qFilter(val);
                        });
                      },
                    ),
                    CustomBtn(
                      onPress: () => context.push(Routes.orderAddEdit),
                      txt: context.l10n.add,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: BlocConsumer<OrderCubit, OrderState>(
                listener: (context, state) {
                  if (state.status == OrderStatus.error ||
                      state.status == OrderStatus.opsuccsess) {
                    showToast(context, state.msg ?? "");
                  }
                },
                builder: (context, state) {
                  var orderList = context.watch<OrderCubit>().getFiltList();
                  if (state.status == OrderStatus.loading) {
                    return const CustomLoading();
                  }
                  if (state.status == OrderStatus.empty ||
                      state.status == OrderStatus.error) {
                    return const NoData();
                  }
                  return SingleChildScrollView(
                    child: OrderCustomTable(
                      clms: [
                        context.l10n.number,
                        context.l10n.name,
                        context.l10n.address,
                        context.l10n.orderDate,
                        context.l10n.deliveryDate,
                        context.l10n.totalAmount,
                        context.l10n.paidAmount,
                        context.l10n.debt,
                        context.l10n.status,
                        context.l10n.action,
                      ],
                      rows: orderList,
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
}
