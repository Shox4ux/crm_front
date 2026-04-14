import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.primary, required this.secondary});
  final String primary;
  final String secondary;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: primary,
        style: AppTxtStl.medium.copyWith(color: AppColour.white),
        children: [
          TextSpan(
            text: secondary,
            style: AppTxtStl.medium.copyWith(
              color: AppColour.textSecondaryDark,
            ),
          ),
        ],
      ),
    );
  }
}
