import 'package:ecom_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:ecom_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              // first name & last name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      EValidation.validateEmptyText('First name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.grey),
                    label: Text(
                      ETexts.firstName,
                      style: TextStyle(
                          color:
                              dark ? EColors.thirdColor : EColors.primaryColor),
                    ),
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: ESizes.inputBetweenFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      EValidation.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.grey),
                    label: Text(
                      ETexts.lastName,
                      style: TextStyle(
                          color:
                              dark ? EColors.thirdColor : EColors.primaryColor),
                    ),
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: ESizes.inputBetweenFields,
          ),
          // username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                EValidation.validateEmptyText('Username', value),
            expands: false,
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: Colors.grey),
              label: Text(
                ETexts.userName,
                style: TextStyle(
                    color: dark ? EColors.thirdColor : EColors.primaryColor),
              ),
              prefixIcon: const Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: ESizes.inputBetweenFields,
          ),
          // email
          TextFormField(
            controller: controller.email,
            validator: (value) => EValidation.validateEmail(value),
            expands: false,
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: Colors.grey),
              label: Text(
                ETexts.email,
                style: TextStyle(
                    color: dark ? EColors.thirdColor : EColors.primaryColor),
              ),
              prefixIcon: const Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: ESizes.inputBetweenFields,
          ),

          // phone
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => EValidation.validatePhoneNumber(value),
            expands: false,
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: Colors.grey),
              label: Text(
                ETexts.phoneNumber,
                style: TextStyle(
                    color: dark ? EColors.thirdColor : EColors.primaryColor),
              ),
              prefixIcon: const Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: ESizes.inputBetweenFields,
          ),

          // password
          Obx(
            ()=> TextFormField(
              obscureText: controller.hidePassword.value,
              controller: controller.password,
              validator: (value) => EValidation.validatePassword(value),
              expands: false,
              decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.grey),
                  label: Text(
                    ETexts.password,
                    style: TextStyle(
                        color: dark ? EColors.thirdColor : EColors.primaryColor),
                  ),
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () =>
                          controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))),
            ),
          ),
          const SizedBox(height: ESizes.defaultBetweenSections),
          // Button create account
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(ETexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
