import 'package:crm_app/app/new/common/ui/app_colour.dart';
import 'package:crm_app/app/new/common/ui/app_radius.dart';
import 'package:crm_app/app/new/common/ui/app_text_style.dart';
import 'package:crm_app/app/new/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/new/warehouse/data/fake_data.dart';
import 'package:flutter/material.dart';

class WareCard extends StatelessWidget {
  const WareCard({super.key, required this.item});
  final WareData item;

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      padding: EdgeInsets.all(10),
      borderRadius: AppRadius.cardRadius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name ?? "",
                    style: AppTextStyle.medium.copyWith(
                      fontSize: 18,
                      color: AppColour.backgroundLight,
                    ),
                  ),
                  Text("\$ " + item.address.toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
