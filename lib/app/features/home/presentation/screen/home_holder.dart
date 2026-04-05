import 'package:crm_app/app/features/client/presentation/bloc/client_cubit.dart';
import 'package:crm_app/app/features/common/widget/custom_footer.dart';
import 'package:crm_app/app/features/home/presentation/widget/custom_data_table.dart';
import 'package:crm_app/app/features/order/domain/entity/order_entity.dart';
import 'package:crm_app/app/features/order/presentation/bloc/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/home/data/fake_data.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/features/common/widget/custom_title.dart';
import 'package:crm_app/app/features/home/presentation/widget/month_drop.dart';
import 'package:crm_app/app/features/home/presentation/widget/order_chart.dart';
import 'package:crm_app/app/features/home/presentation/widget/dashboard_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeHolder extends StatefulWidget {
  const HomeHolder({super.key});

  @override
  State<HomeHolder> createState() => _HomeHolderState();
}

class _HomeHolderState extends State<HomeHolder> {
  int clientCount = 0;
  int orderCount = 0;
  double revenue = 0.0;

  void _setClientCount() {
    context.read<ClientCubit>().getAllClient();
    clientCount = context.read<ClientCubit>().state.list.length;
    dashItems.where((item) => item.type == DashType.client).first.index =
        clientCount;
  }

  void _setOrderCount() {
    context.read<OrderCubit>().getAllOrder();
    orderCount = context.read<OrderCubit>().state.list?.length ?? 0;
    dashItems.where((item) => item.type == DashType.order).first.index =
        orderCount;
  }

  double calculateRevenue(List<OrderEntity>? list) {
    double totalRevenue = 0.0;
    if (list != null) {
      for (var order in list) {
        totalRevenue += order.paidAmount;
      }
    }
    return totalRevenue;
  }

  double calculateDebt(List<OrderEntity>? list) {
    double totalDebt = 0.0;
    if (list != null) {
      for (var order in list) {
        // totalDebt += (order. - order.paidAmount);
      }
    }
    return totalDebt;
  }

  void _setRevenue() {
    var orders = context.read<OrderCubit>().state.list;
    revenue = calculateRevenue(orders);
    dashItems.where((item) => item.type == DashType.revenue).first.index =
        revenue;
  }

  void _setDebt() {
    var orders = context.read<OrderCubit>().state.list;
    revenue = calculateRevenue(orders);
    dashItems.where((item) => item.type == DashType.revenue).first.index =
        revenue;
  }

  @override
  void initState() {
    _setClientCount();
    _setOrderCount();
    _setRevenue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      child: SingleChildScrollView(
        child: Column(
          spacing: 40,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitle(title: "Dashboard"),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 40,
                childAspectRatio: 250 / 140,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dashItems.length,
              itemBuilder: (_, i) => DashboardCard(item: dashItems[i]),
            ),
            BorderedContainer(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              borderRadius: AppRadius.cardRadius,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 30,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTitle(title: "Order Overview", fontSize: 24),
                      MonthDrop(),
                    ],
                  ),
                  OrderChart(),
                ],
              ),
            ),
            BorderedContainer(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              borderRadius: AppRadius.cardRadius,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 30,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTitle(title: "Order Overview", fontSize: 24),
                      MonthDrop(),
                    ],
                  ),
                  CustomTable(
                    columns: ["Name", "Age", "Address"],
                    rows: [
                      ["John Doe", "30", "123 Main St"],
                      ["Jane Smith", "25", "456 Oak Ave"],
                      ["Sam Johnson", "40", "789 Pine Rd"],
                    ],
                  ),
                ],
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
