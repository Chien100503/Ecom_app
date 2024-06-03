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
  static const Color primaryColor = Color(0xFF4B68FF);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFB0C7FF);

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xff6c756d);
  static const Color textAccent = Colors.white;

  // Background Colors
  static const Color light = Color(0xfff6f6f6);
  static const Color dark = Color(0xff272727);
  static const Color primaryBg = Color(0xfff3f5ff);

  // Background containers color
  static const Color lightContainer = Color(0xfff6f6f6);
  static Color darkContainer = EColors.light.withOpacity(0.1);

// Button
}
