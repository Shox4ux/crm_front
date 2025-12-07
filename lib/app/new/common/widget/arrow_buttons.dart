import 'package:crm_app/app/new/common/ui/app_assets.dart';
import 'package:crm_app/app/new/common/ui/app_colour.dart';
import 'package:crm_app/app/new/common/ui/app_radius.dart';
import 'package:crm_app/app/new/home/presentation/widget/bordered_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArrowButtons extends StatelessWidget {
  const ArrowButtons({super.key, this.onLeft, this.onRight});
  final VoidCallback? onLeft;
  final VoidCallback? onRight;

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      borderRadius: AppRadius.buttonRadius,
      borderColor: AppColour.whiteStroke,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 15,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(AppAssets.leftArrow),
            onPressed: onLeft,
          ),
          Flexible(
            child: Container(
              color: AppColour.whiteStroke,
              width: 1,
              height: 40,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(AppAssets.rightArrow),
            onPressed: onRight,
          ),
        ],
      ),
    );
  }
}
