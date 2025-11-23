import 'package:flutter/material.dart';

class TitledTxt extends StatelessWidget {
  const TitledTxt({super.key, required this.titleTxt, required this.bodyTxt});
  final String titleTxt;
  final String bodyTxt;

  @override
  Widget build(BuildContext context) => RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: titleTxt,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(text: bodyTxt),
      ],
    ),
  );
}
