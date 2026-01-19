import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_footer.dart';
import 'package:crm_app/app/features/common/widget/custom_search.dart';
import 'package:crm_app/app/features/core/router/route_names.dart';
import 'package:crm_app/app/features/order/data/fake_data.dart';
import 'package:crm_app/app/features/order/presentation/widget/custom_filter.dart';
import 'package:crm_app/app/features/order/presentation/widget/custom_table.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

var list = ["name", "address", "date", "type", "status"];

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 30,
          children: [
            // CustomTitle(title: "Orders"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomFilter(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    CustomSearch(),
                    CustomBtn(
                      onPress: () => context.push(Routes.orderAddEdit),
                      txt: "Add",
                    ),
                  ],
                ),
              ],
            ),
            LayoutBuilder(
              builder: (context, bx) {
                return CustomTable(clms: list, rows: orderList);
              },
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
