import 'package:crm_app/app/new/common/ui/app_colour.dart';
import 'package:crm_app/app/new/common/ui/app_radius.dart';
import 'package:crm_app/app/new/common/ui/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.onPress,
    required this.txt,
    this.bgColor = AppColour.stroke,
    this.txtColor = AppColour.white,
    this.padding,
  });
  final void Function() onPress;
  final String txt;
  final Color bgColor;
  final Color txtColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,

      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: txtColor,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.buttonRadius),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        elevation: 3,
      ),
      child: Text(txt, style: AppTextStyle.medium),
    );
  }
}
