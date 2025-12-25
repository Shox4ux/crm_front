import 'package:crm_app/app/features/client/domain/entity/client_entity.dart';
import 'package:crm_app/app/features/common/ui/app_assets.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({super.key, required this.item});
  final ClientEntity item;
  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      padding: EdgeInsets.all(10),
      borderRadius: AppRadius.cardRadius,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 55,
            backgroundColor: AppColour.backgroundDark,
            child: SvgPicture.asset(AppAssets.clients),
          ),
          SizedBox(height: 10),
          Text(
            item.user.username ?? "",
            style: AppTextStyle.medium.copyWith(
              fontSize: 18,
              color: AppColour.backgroundLight,
            ),
          ),
          Text("\$ ${item.user.phone}"),
        ],
      ),
    );
  }
}
