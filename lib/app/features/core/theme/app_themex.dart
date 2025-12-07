import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemeX {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    disabledColor: AppColour.stroke,

    // ---------------------
    // Global Colors
    // ---------------------
    colorScheme: ColorScheme.light(
      primary: AppColour.primaryLight,
      secondary: AppColour.secondaryLight,
      surface: AppColour.backgroundLight,
    ),

    // scaffoldBackgroundColor: const Color(0xFFF5F6FA),

    // ---------------------
    // Global AppBar Theme
    // ---------------------
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColour.backgroundLight,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColour.textLight,
      ),
      iconTheme: IconThemeData(color: AppColour.primaryLight, size: 24),
    ),

    // ---------------------
    // Global Drawer Theme
    // ---------------------
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColour.backgroundLight,
      scrimColor: Colors.transparent, // optional
      elevation: 0,
      width: 260,
    ),

    // ---------------------
    // Global Text Styles
    // ---------------------
    textTheme: GoogleFonts.nunitoSansTextTheme().copyWith(
      titleLarge: const TextStyle(color: AppColour.textLight),
      titleMedium: const TextStyle(color: AppColour.textLight),
      titleSmall: const TextStyle(color: AppColour.textLight),
      bodySmall: const TextStyle(color: AppColour.textSecondaryLight),
      bodyLarge: const TextStyle(color: AppColour.textLight),
      bodyMedium: const TextStyle(color: AppColour.textSecondaryLight),
    ),

    // ---------------------
    // Global ListTile (Drawer Items)
    // ---------------------
    // listTileTheme: ListTileThemeData(
    //   selectedColor: Colors.white,
    //   selectedTileColor: const Color(0xFF4880FF).withValues(alpha: 0.15),
    //   iconColor: Colors.white.withValues(alpha: 0.8),
    //   textColor: Colors.white.withValues(alpha: 0.8),
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   minVerticalPadding: 14,
    // ),
  );

  // ---------------------
  // Dark Theme
  // ---------------------
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    disabledColor: AppColour.stroke,
    colorScheme: ColorScheme.dark(
      primary: AppColour.secondaryDark,
      secondary: AppColour.primaryDark,
      surface: AppColour.backgroundDark,
    ),
    scaffoldBackgroundColor: AppColour.backgroundDark,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColour.primaryDark,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColour.textDark,
      ),
      iconTheme: IconThemeData(color: AppColour.textDark, size: 24),
    ),

    drawerTheme: const DrawerThemeData(
      scrimColor: Colors.transparent,
      backgroundColor: AppColour.primaryDark,
      width: 260,
      elevation: 0,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColour.secondaryDark,
      colorScheme: ColorScheme.dark(),
    ),
    textTheme: GoogleFonts.nunitoSansTextTheme().copyWith(
      titleLarge: const TextStyle(color: AppColour.textDark),
      titleMedium: const TextStyle(color: AppColour.textDark),
      titleSmall: const TextStyle(color: AppColour.textDark),
      bodySmall: const TextStyle(color: AppColour.textSecondaryDark),
      bodyLarge: const TextStyle(color: AppColour.textDark),
      bodyMedium: const TextStyle(color: AppColour.textSecondaryDark),
    ),

    // listTileTheme: ListTileThemeData(
    //   selectedColor: Colors.white,
    //   selectedTileColor: const Color(0xFF4880FF).withValues(alpha: 0.20),
    //   iconColor: Colors.white.withValues(alpha: 0.9),
    //   textColor: Colors.white.withValues(alpha: 0.85),
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   minVerticalPadding: 14,
    // ),
  );
}
