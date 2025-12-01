import 'package:flutter/material.dart';

abstract class AppColour {
  static const Color stroke = Color(0xff979797);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color red = Color(0xffF93C65);
  static const Color green = Color(0xff00B69B);

  // Light Theme
  static const backgroundLight = Color(0xFFF5F6FA);
  static const primaryLight = Color(0xFFffffff);
  static const secondaryLight = Color(0xFF4880FF);
  static const textLight = Color(0xFF202224);
  static const textSecondaryLight = Color(0xFF606060);
  static const Color textFieldBgLight = Color(0xffF5F6FA);

  static const completedLight = Color(0xFFCCF0EB);
  static const inprocessLight = Color(0xFFE6D9FB);
  static const onholdLight = Color(0xFFFFF1E6);
  static const intransitLight = Color(0xFFF3E5FF);
  static const rejectedLight = Color(0xFFFFDAD6);

  // Dark Theme
  static const backgroundDark = Color(0xFF1B2431);
  static const primaryDark = Color(0xFF273142);
  static const secondaryDark = Color(0xFF4880FF);
  static const textDark = Color(0xFFFFFFFF);
  static const textSecondaryDark = Color(0xB3FFFFFF);
  static const Color textFieldBgDark = Color(0xff323D4E);

  static const rejectedDark = Color(0xFFEF3826);
  static const completedDark = Color(0xFF00B69B);
  static const inprocessDark = Color(0xFF6226EF);
  static const onholdDark = Color(0xFFFFA756);
  static const intransitDark = Color(0xFFBA29FF);
}
