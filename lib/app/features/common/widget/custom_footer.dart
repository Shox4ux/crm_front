import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/common/widget/arrow_buttons.dart';
import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({
    super.key,
    this.onLeftPressed,
    this.onRightPressed,
    required this.totalCount,
    required this.pageCount,
  });
  final VoidCallback? onLeftPressed;
  final VoidCallback? onRightPressed;
  final int totalCount;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Showing $pageCount of $totalCount",
          style: AppTextStyle.medium.copyWith(fontSize: 14),
        ),
        ArrowButtons(onLeft: onLeftPressed, onRight: onRightPressed),
      ],
    );
  }
}
