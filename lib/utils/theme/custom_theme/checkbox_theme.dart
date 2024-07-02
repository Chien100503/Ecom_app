import 'package:ecom_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ECheckBoxTheme {
  ECheckBoxTheme._();

  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return EColors.thirdColor;
      } else {
        return EColors.primaryColor;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return EColors.primaryColor; // Change to a visible color in light mode
      } else {
        return EColors.thirdColor;
      }
    }),
  );

  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return EColors.primaryColor;
      } else {
        return EColors.thirdColor;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return EColors.thirdColor;
      } else {
        return EColors.primaryColor;
      }
    }),
  );
}