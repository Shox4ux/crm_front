import 'package:crm_app/app/features/client/presentation/widget/avatar_frame.dart';
import 'package:crm_app/app/features/common/widget/img_error.dart';
import 'package:flutter/material.dart';

class RemoteAvatar extends StatelessWidget {
  const RemoteAvatar({super.key, this.url, this.onTap, this.radius = 100});
  final String? url;
  final void Function()? onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return AvatarFrame(
      isFile: url != null,
      radius: radius,
      onTap: onTap,
      child: Image.network(
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child; // IMAGE LOADED
          }
          return const OnImgError(
            isAvatar: true,
            isClient: true,
          ); // LOADING PLACEHOLDER
        },
        url ?? "",
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const OnImgError(isAvatar: true),
      ),
    );
  }
}
