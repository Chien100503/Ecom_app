import 'package:ecom_app/features/shop/screens/wishList/wishlist.dart';
import 'package:ecom_app/navigation_menu.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ECustomSnackBar {
  final String title;
  final String message;

  ECustomSnackBar({required this.title, this.message = ''});

  static void showWarning({required String title, String message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: EColors.thirdColor,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: EColors.thirdColor),
    );
  }

  static void showSuccess({required String title, String message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: EColors.thirdColor,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.check, color: EColors.thirdColor),
    );
  }

  static void showError({required String title, String message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: EColors.thirdColor,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.close_circle, color: EColors.thirdColor),
    );
  }

  static customToast({required message, onTap, note}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      elevation: 0,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: EHelperFunctions.isDarkMode(Get.context!)
              ? EColors.primaryColor
              : EColors.thirdColor,
        ),
        child: Center(
          child: Column(children: [
            Text(message, style: Theme.of(Get.context!).textTheme.labelLarge),
            TextButton(onPressed: onTap, child: Text(note))
          ]),
        ),
      ),
    ));
  }
}
