import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ETextTheme {
  ETextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: EColors.primaryColor),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: EColors.primaryColor),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: EColors.primaryColor),

    titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: EColors.primaryColor),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: EColors.primaryColor),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: EColors.primaryColor),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: EColors.primaryColor),
    bodyMedium: const TextStyle().copyWith(fontSize: 13.0, fontWeight: FontWeight.normal, color: EColors.primaryColor),
    bodySmall: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w500, color: EColors.primaryColor),

    labelLarge: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: EColors.primaryColor),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.bold, color: EColors.primaryColor),

    labelSmall: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: EColors.primaryColor)
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: EColors.thirdColor),

    titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: EColors.thirdColor),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: EColors.thirdColor),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),

    bodyLarge: const TextStyle().copyWith(fontSize: 15.0, fontWeight: FontWeight.w600, color: EColors.thirdColor),
    bodyMedium: const TextStyle().copyWith(fontSize: 13.0, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w500, color: EColors.thirdColor),

    labelLarge: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white),
      labelSmall: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white)
  );
}