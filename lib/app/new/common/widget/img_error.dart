import 'package:crm_app/app/utils/conts/app_assets.dart';
import 'package:flutter/material.dart';

class OnImgError extends StatelessWidget {
  const OnImgError({super.key, this.height, this.width});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.defaultImg,

      width: width ?? double.maxFinite,
      height: height ?? double.maxFinite,
      fit: BoxFit.contain,
    );
  }
}
