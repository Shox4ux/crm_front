import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: "Poppins", // 👈 apply font globally
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16),
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white, // sets title & icons to white
      elevation: 0,
      centerTitle: true,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}
