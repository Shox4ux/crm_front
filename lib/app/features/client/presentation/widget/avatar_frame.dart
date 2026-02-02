import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:flutter/material.dart';

class AvatarFrame extends StatelessWidget {
  const AvatarFrame({
    super.key,
    required this.child,
    this.onTap,
    this.size = 300,
    required this.radius,
    this.isFile = false,
    this.isClient = false,
  });
  final Widget child;
  final bool isFile;
  final bool isClient;

  final double radius;
  final double size;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColour.avatarBg,
        radius: radius,
        child: Container(
          padding: isFile
              ? isClient
                    ? EdgeInsets.all(30)
                    : null
              : EdgeInsets.all(70),
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColour.secondaryLight, width: 4),
          ),
          child: isFile ? ClipOval(child: child) : child,
        ),
      ),
    );
  }
}
