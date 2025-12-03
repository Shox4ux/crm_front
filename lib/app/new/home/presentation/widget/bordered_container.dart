import 'package:crm_app/app/new/common/ui/app_colour.dart';
import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.color = AppColour.primaryDark,
    this.borderColor = AppColour.stroke,
  });
  final BorderRadiusGeometry? borderRadius;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        border: Border.all(width: 1, color: borderColor),
      ),
      child: child,
    );
  }
}
