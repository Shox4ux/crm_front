import 'package:flutter/material.dart';

abstract class AppColour {
  static const Color dashClient = Colors.deepPurpleAccent;
  static const Color dashOrder = Colors.amber;
  static const Color dashChart = Colors.green;
  static const Color dashPending = Colors.deepOrangeAccent;
  static final Color whiteStroke = Color(0xffCFCFCF).withValues(alpha: 0.1);
  // ---------------
  static const Color stroke = Color(0xff313D4F);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color red = Color(0xffF93C65);
  static const Color green = Color(0xff00B69B);
  static const Color avatarBg = Color(0xffECECEE);
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

  static const clSecond = Color(0xFF273143);
  static const clStroke = Color(0xFF364050);
  static const clTxtBg = Color(0xFF323d4f);
  static const clHint = Color(0xFFb6b6b6);

  // big bg {#1b2431} yes
  //second {#273143}
  //stroke {#364050}
  //txt field bg {#323d4f}
  //hint txt {#b6b6b6}
  //label txt {white}
}
