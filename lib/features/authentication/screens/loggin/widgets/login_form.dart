import 'package:ecom_app/features/authentication/screens/password/forget_password.dart';
import 'package:ecom_app/features/authentication/screens/signup/signup.dart';
import 'package:ecom_app/navigation_menu.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts_strings.dart';

class ELoginForm extends StatelessWidget {
   const ELoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: ESizes.defaultBetweenSections),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.direct_right),
                labelStyle: const TextStyle(color: Colors.grey),
                label: Text(ETexts.email,style: TextStyle(color: dark ? EColors.thirdColor : EColors.primaryColor),),
                // labelText: ETexts.email,
              ),
            ),
            const SizedBox(
              height: ESizes.inputBetweenFields,
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelStyle: const TextStyle(color: Colors.grey),
                label: Text(ETexts.email,style: TextStyle(color: dark ? EColors.thirdColor : EColors.primaryColor),),
                suffixIcon: const Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: ESizes.inputBetweenFields / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 24, height: 24, child: Checkbox(value: true, onChanged: (value) {})),
                    const Text(ETexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPasswordScreen(),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 500)
                  ),
                  child: const Text(ETexts.forgetPassword,),
                ),
              ],
            ),
            const SizedBox(
              height: ESizes.defaultBetweenSections,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const NavigationMenu(),
                    transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 500)
                    ), child: const Text(ETexts.signIn))),
            const SizedBox(
              height: ESizes.defaultBetweenItem,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const SignupScreen(),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 500)
                ),
                child: const Text(ETexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}