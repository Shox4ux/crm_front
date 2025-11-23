import 'package:crm_app/app/utils/conts/app_colors.dart';
import 'package:flutter/material.dart';

var txs = TextStyle(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

class CustomDoubleText extends StatelessWidget {
  const CustomDoubleText({
    super.key,
    this.ttl = "Total amount: ",
    this.b = "",
    this.isNum = false,
  });
  final String ttl;
  final String b;
  final bool isNum;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: ttl, style: txs),
          TextSpan(
            text: isNum ? "$b \$" : b,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.appBlack,
            ),
          ),
        ],
      ),
    );
  }
}
