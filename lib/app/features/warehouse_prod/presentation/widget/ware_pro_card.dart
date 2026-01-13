import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/features/warehouse_prod/domain/entity/ware_pro_entitiy.dart';
import 'package:crm_app/app/features/warehouse_prod/presentation/widget/enums.dart';
import 'package:crm_app/app/features/warehouse_prod/presentation/widget/ware_pro_menu.dart';
import 'package:flutter/material.dart';

class WareProCard extends StatelessWidget {
  const WareProCard({super.key, required this.item});
  final WareProEntitiy item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BorderedContainer(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item.product?.name ?? "",
                        style: AppTxtStl.medium.copyWith(
                          fontSize: 18,
                          color: AppColour.backgroundLight,
                        ),
                      ),
                      Text("\$ ${item.product?.sellPrice}"),
                      Text("${item.quantity} units"),
                      StatusItem(status: statusFromInt(item.status)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        WareProMenu(data: item),
      ],
    );
  }
}
