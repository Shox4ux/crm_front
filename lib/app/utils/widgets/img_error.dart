import 'package:crm_app/app/utils/conts/app_assets.dart';
import 'package:flutter/material.dart';

class OnImgError extends StatelessWidget {
  const OnImgError({super.key, this.size});
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.defaultImg,
      width: size ?? double.maxFinite,
      height: size ?? 190,
      fit: BoxFit.cover,
    );
  }
}
