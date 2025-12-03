import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static TextStyle small = TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  static TextStyle medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static TextStyle large = TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
}
