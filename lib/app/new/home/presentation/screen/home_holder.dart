import 'package:flutter/material.dart';
import 'package:crm_app/app/new/common/ui/app_radius.dart';
import 'package:crm_app/app/new/common/ui/app_text_style.dart';
import 'package:crm_app/app/new/home/data/fake_data.dart';
import 'package:crm_app/app/new/home/presentation/widget/arrow_buttons.dart';
import 'package:crm_app/app/new/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/new/home/presentation/widget/custom_data_table.dart';
import 'package:crm_app/app/new/common/widget/custom_title.dart';
import 'package:crm_app/app/new/home/presentation/widget/month_drop.dart';
import 'package:crm_app/app/new/home/presentation/widget/order_chart.dart';
import 'package:crm_app/app/new/home/presentation/widget/dashboard_card.dart';

class HomeHolder extends StatelessWidget {
  const HomeHolder({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Showing 1-09 of 78",
                  style: AppTextStyle.medium.copyWith(fontSize: 14),
                ),
                ArrowButtons(onLeftPressed: () {}, onRightPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
