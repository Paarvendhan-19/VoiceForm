import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// AppTheme - Indian Flag Color Palette
/// Primary: Deep Saffron (#FF9933)
/// Secondary: India Green (#138808)
/// Background: White (#FFFFFF)
/// Text/Icons: Navy Blue (#000080)
class AppTheme {
  // Indian Flag Colors
  static const Color saffron = Color(0xFFFF9933);
  static const Color green = Color(0xFF138808);
  static const Color white = Color(0xFFFFFFFF);
  static const Color navyBlue = Color(0xFF000080);
  
  // Gradient Colors
  static const Color saffronLight = Color(0xFFFFB366);
  static const Color saffronDark = Color(0xFFE68A00);
  static const Color greenLight = Color(0xFF1AA910);
  static const Color greenDark = Color(0xFF0D6605);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [saffronLight, saffron, saffronDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [greenLight, green, greenDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    colors: [saffron, green],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static LinearGradient shimmerGradient = LinearGradient(
    colors: [
      white.withOpacity(0.1),
      white.withOpacity(0.3),
      white.withOpacity(0.1),
    ],
  );

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
        error: Colors.red.shade700,
      ),
      scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: navyBlue,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: navyBlue,
        ),
        headlineLarge: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: navyBlue,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: navyBlue,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: navyBlue,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: navyBlue,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          color: navyBlue,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          color: navyBlue,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: white,
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: navyBlue,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: navyBlue,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: navyBlue.withOpacity(0.1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: navyBlue.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: saffron, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red.shade700, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    );
  }
}
