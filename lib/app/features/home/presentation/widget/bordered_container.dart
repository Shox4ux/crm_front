import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.border,
    this.color = AppColour.primaryDark,
    this.borderColor,
    this.height,
    this.width,
  });

  final BorderRadiusGeometry? borderRadius;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? borderColor;
  final Border? border;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        border: Border.all(width: 1, color: borderColor ?? AppColour.stroke),
      ),
      child: child,
    );
  }
}
