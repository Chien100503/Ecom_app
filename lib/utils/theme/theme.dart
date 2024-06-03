import 'package:ecom_app/utils/theme/custom_theme/appbar_theme.dart';
import 'package:ecom_app/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:ecom_app/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:ecom_app/utils/theme/custom_theme/chip_theme.dart';
import 'package:ecom_app/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:ecom_app/utils/theme/custom_theme/textField_theme.dart';
import 'package:ecom_app/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

import 'custom_theme/elevated_button_theme.dart';

class EAppTheme {
  EAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      checkboxTheme: ECheckBoxTheme.lightCheckBoxTheme,
      chipTheme: EChipTheme.lightChipTheme,
      textTheme: ETextTheme.lightTextTheme,
      elevatedButtonTheme: EElevatedButtonTheme.lightElevatedButtonTheme,
      appBarTheme: EAppBarTheme.lightAppBarTheme,
      outlinedButtonTheme: EOutlinedButtonTheme.lightOutlinedButtonTheme,
      bottomSheetTheme: EBottomSheetTheme.lightBottomSheetTheme,
      inputDecorationTheme: ETextFieldTheme.lightInputDecorationTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      checkboxTheme: ECheckBoxTheme.darkCheckBoxTheme,
      chipTheme: EChipTheme.darkChipTheme,
      textTheme: ETextTheme.darkTextTheme,
      elevatedButtonTheme: EElevatedButtonTheme.darkElevatedButtonTheme,
      appBarTheme: EAppBarTheme.darkAppBarTheme,
      outlinedButtonTheme: EOutlinedButtonTheme.darkOutlinedButtonTheme,
      bottomSheetTheme: EBottomSheetTheme.darkBottomSheetTheme,
      inputDecorationTheme: ETextFieldTheme.darkInputDecorationTheme);
}
