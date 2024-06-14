import 'package:flutter/material.dart';

class EColors {
  EColors._();

  // Gradient colors
  static const Gradient linerGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.070, -0.707),
      colors: [
        Color(0xffff9a9e),
        Color(0xfffad0c4),
        Color(0xfffad0c4),
      ]);

  // App basic colors
  static const Color primaryColor = Color(0xFF543310);
  static const Color secondary = Color(0xFF74512D);
  static const Color accent = Color(0xFFAF8F6F);
  static const Color thirdColor = Color(0xFFF8F4E1);
  static const Color darkGrey = Color(0xff6c756d);

  // Text Colors
  static const Color textPrimary = Color(0xFF543310);
  static const Color textSecondary = Color(0xff6c756d);
  static const Color textAccent = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFF8F4E1);
  static const Color dark = Color(0xFF543310);
  static const Color primaryBg = Color(0xfff3f5ff);

  static const Color cardLight = Color(0xffEFEFEF);
  static const Color cardDark = Color(0xffEFEFEF);

  // Background containers color
  static const Color lightContainer = Color(0xfff6f6f6);
  static Color darkContainer = EColors.light.withOpacity(0.1);

// Button
}
