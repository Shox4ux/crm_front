import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/features/warehouse/domain/entity/warehouse_entity.dart';
import 'package:crm_app/app/features/warehouse/presentation/widgets/pop_menu.dart';
import 'package:flutter/material.dart';

class WareCard extends StatelessWidget {
  const WareCard({super.key, required this.item});
  final WarehouseEntity item;

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
                    children: [
                      Text(
                        item.name,
                        style: AppTxtStl.medium.copyWith(
                          fontSize: 18,
                          color: AppColour.backgroundLight,
                        ),
                      ),
                      Text("\$ ${item.address}"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomMenu(data: item),
      ],
    );
  }
}
