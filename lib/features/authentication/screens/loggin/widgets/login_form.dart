import 'package:ecom_app/features/authentication/controllers/login/login_controller.dart';
import 'package:ecom_app/features/authentication/screens/password/forget_password.dart';
import 'package:ecom_app/features/authentication/screens/signup/signup.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:ecom_app/utils/validators/validation.dart';
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
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(vertical: ESizes.defaultBetweenSections),
        child: Column(
          children: [
            TextFormField(
              validator: (value) => EValidation.validateEmail(value),
              controller: controller.email,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.direct_right),
                labelStyle: const TextStyle(color: Colors.grey),
                label: Text(
                  ETexts.email,
                  style: TextStyle(
                      color: dark ? EColors.thirdColor : EColors.primaryColor),
                ),
              ),
            ),
            const SizedBox(
              height: ESizes.inputBetweenFields,
            ),
            Obx(
                  () => TextFormField(
                validator: (value) =>
                    EValidation.validateEmptyText('Password', value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelStyle: const TextStyle(color: Colors.grey),
                  label: Text(
                    ETexts.password, // Corrected label to ETexts.password
                    style: TextStyle(
                      color: dark ? EColors.thirdColor : EColors.primaryColor,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                    !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: ESizes.inputBetweenFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Obx(
                            () => Checkbox(
                          value: controller.remember.value,
                          onChanged: (value) => controller.remember.value =
                          !controller.remember.value,
                        ),
                      ),
                    ),
                    const Text(ETexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPasswordScreen(),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 500)),
                  child: const Text(
                    ETexts.forgetPassword,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: ESizes.defaultBetweenSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(ETexts.signIn),
              ),
            ),
            const SizedBox(
              height: ESizes.defaultBetweenItem,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const SignupScreen(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 500)),
                child: const Text(ETexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
