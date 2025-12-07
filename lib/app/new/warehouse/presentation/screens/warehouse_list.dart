import 'package:crm_app/app/new/common/widget/custom_btn.dart';
import 'package:crm_app/app/new/common/widget/custom_search.dart';
import 'package:crm_app/app/new/common/widget/custom_title.dart';
import 'package:crm_app/app/new/warehouse/data/fake_data.dart';
import 'package:crm_app/app/new/warehouse/presentation/widgets/ware_card.dart';
import 'package:flutter/material.dart';

class WarehouseList extends StatelessWidget {
  const WarehouseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        spacing: 30,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTitle(title: "Warehouse"),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  CustomSearch(),
                  CustomBtn(onPress: () {}, txt: "Add"),
                ],
              ),
            ],
          ),
          Flexible(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              shrinkWrap: true,
              itemCount: wareList.length,
              itemBuilder: (_, i) => WareCard(item: wareList[i]),
            ),
          ),
        ],
      ),
    );
  }
}
