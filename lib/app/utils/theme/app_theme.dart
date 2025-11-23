import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: "Poppins", // 👈 apply font globally
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16),
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(elevation: 2, centerTitle: true),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}
