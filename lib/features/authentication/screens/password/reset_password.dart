import 'package:ecom_app/features/authentication/controllers/forget_password/forget_password.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/constants/texts_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_functions.dart';
import '../loggin/login.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Center(
                  child: Image(
                image: const AssetImage(EImages.resetPassword),
                width: EHelperFunctions.screenWidth() * 0.6,
              )),

              const SizedBox(
                height: ESizes.defaultBetweenSections,
              ),
              // Title and subtitle
              Text(
                ETexts.changePasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ESizes.defaultBetweenItem,
              ),
              Text(
                ETexts.changePasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ESizes.defaultBetweenSections,
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(
                    () => const LoginScreen(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 500),
                  ),
                  child: const Text('Done'),
                ),
              ),
              const SizedBox(height: ESizes.defaultBetweenItem),
              TextButton(onPressed: () => controller.resendPasswordResetEmail(email), child: const Text('Resend Email')),
            ],
          ),
        ),
      ),
    );
  }
}
