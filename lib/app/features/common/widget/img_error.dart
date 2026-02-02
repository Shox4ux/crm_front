import 'package:crm_app/app/features/common/ui/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnImgError extends StatelessWidget {
  const OnImgError({
    super.key,
    this.height,
    this.width,
    this.isAvatar = false,
    this.isClient = false,
  });
  final double? width;
  final double? height;
  final bool isAvatar;
  final bool isClient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isClient ? 40 : 8),
      child: isAvatar
          ? SvgPicture.asset(isClient ? AppAssets.clients : AppAssets.camera)
          : Image.asset(
              AppAssets.defaultImg,
              width: width ?? double.maxFinite,
              height: height ?? double.maxFinite,
              fit: BoxFit.contain,
            ),
    );
  }
}
