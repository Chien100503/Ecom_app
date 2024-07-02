import 'package:ecom_app/bindings/general_bindings.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: EAppTheme.lightTheme,
      darkTheme: EAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(backgroundColor: EColors.primaryColor, body: Center(child: CircularProgressIndicator(color: EColors.thirdColor,),),),
    );
  }
}
