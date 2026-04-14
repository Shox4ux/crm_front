import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:flutter/material.dart';

class ClmCell extends StatelessWidget {
  const ClmCell({super.key, this.txt = ""});
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        txt.toUpperCase(),
        textAlign: TextAlign.center,
        style: AppTxtStl.medium.copyWith(color: AppColour.white),
      ),
    );
  }
}
