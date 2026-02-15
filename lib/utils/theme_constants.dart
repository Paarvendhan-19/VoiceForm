import 'package:flutter/material.dart';

/// Indian Flag color palette for Vani-Sahayak app theme
/// Based on Requirements 7.2, 7.3, 7.4, 7.5
class ThemeConstants {
  // Indian Flag Colors
  static const Color saffron = Color(0xFFFF9933);
  static const Color white = Color(0xFFFFFFFF);
  static const Color green = Color(0xFF128807);
  static const Color navyBlue = Color(0xFF000080);

  // Material 3 Theme Configuration
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: saffron,
        secondary: green,
        surface: white,
        onPrimary: white,
        onSecondary: white,
        onSurface: navyBlue,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: saffron,
        foregroundColor: white,
        iconTheme: IconThemeData(color: navyBlue),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: green,
          foregroundColor: white,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: green,
        foregroundColor: white,
      ),
      iconTheme: const IconThemeData(
        color: navyBlue,
      ),
      cardTheme: CardThemeData(
        color: white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
