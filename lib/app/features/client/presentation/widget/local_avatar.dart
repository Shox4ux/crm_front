import 'dart:io';
import 'package:crm_app/app/features/client/presentation/widget/avatar_frame.dart';
import 'package:crm_app/app/features/common/ui/app_assets.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocalAvatar extends StatelessWidget {
  const LocalAvatar({
    super.key,
    this.onTap,
    this.image,
    this.isClient = false,
    this.radius = 100,
  });
  final void Function()? onTap;
  final File? image;
  final double radius;
  final bool isClient;

  @override
  Widget build(BuildContext context) {
    return AvatarFrame(
      radius: radius,
      onTap: onTap,
      isFile: isClient || image != null,
      isClient: isClient,
      child: image != null
          ? Image.file(image!, fit: BoxFit.cover)
          : isClient
          ? SvgPicture.asset(AppAssets.clients, color: AppColour.backgroundDark)
          : SvgPicture.asset(AppAssets.camera),
    );
  }
}
