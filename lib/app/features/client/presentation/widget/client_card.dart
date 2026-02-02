import 'package:crm_app/app/features/client/domain/entity/client_entity.dart';
import 'package:crm_app/app/features/client/presentation/widget/local_avatar.dart';
import 'package:crm_app/app/features/client/presentation/widget/remote_avatar.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/utils/extensions/full_url.dart';
import 'package:flutter/material.dart';

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
          item.user.img != null
              ? RemoteAvatar(url: item.user.img.fullUrl(), radius: 70)
              : LocalAvatar(isClient: true, radius: 70),
          SizedBox(height: 10),
          Text(
            item.user.username ?? "",
            style: AppTxtStl.medium.copyWith(
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
