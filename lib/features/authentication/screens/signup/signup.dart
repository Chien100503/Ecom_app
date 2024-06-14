import 'package:ecom_app/features/authentication/screens/loggin/widgets/login_social_button.dart';
import 'package:ecom_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecom_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecom_app/features/authentication/screens/signup/widgets/term_conditions_checkbox.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/constants/texts_strings.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../loggin/widgets/login_divider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              Text(
                ETexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(
                height: ESizes.defaultBetweenSections,
              ),

              // Form
              const SignupForm(),
              // term & conditions Checkbox
              const termConditionsCheckbox(),

              const SizedBox(
                height: ESizes.defaultBetweenSections,
              ),
              // Button create account
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const VerifyEmailScreen(),
                      transition: Transition.rightToLeftWithFade,
                      duration: Duration(milliseconds: 500)),
                  child: const Text(ETexts.createAccount),
                ),
              ),
              const SizedBox(
                height: ESizes.defaultBetweenItem,
              ),
              // Divider
              EFormDivider(
                dividerText: ETexts.orSignUpWith.capitalize!,
              ),
              const SizedBox(
                height: ESizes.defaultBetweenItem,
              ),
              const ESocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
