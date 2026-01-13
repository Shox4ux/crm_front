import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:flutter/material.dart';

class DialogTitle extends StatelessWidget {
  const DialogTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(color: AppColour.backgroundLight));
  }
}
