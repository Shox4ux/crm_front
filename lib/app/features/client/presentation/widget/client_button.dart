import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:flutter/material.dart';

class ClientButton extends StatelessWidget {
  const ClientButton({super.key, required this.onPress, required this.txt});
  final void Function() onPress;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return CustomBtn(
      onPress: onPress,
      txt: txt,
      bgColor: AppColour.secondaryDark,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    );
  }
}
