import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title, this.fontSize});
  final String title;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.large.copyWith(
        color: AppColour.white,
        fontSize: fontSize,
      ),
    );
  }
}
