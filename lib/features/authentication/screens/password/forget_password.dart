import 'package:ecom_app/features/authentication/screens/password/reset_password.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/texts_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              Center(
                  child: Image(
                image: const AssetImage(EImages.forget),
                width: EHelperFunctions.screenWidth() * 0.6,
              )),

              const SizedBox(
                height: ESizes.defaultBetweenSections,
              ),
              // Title and subtitle
              Text(
                ETexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ESizes.defaultBetweenItem,
              ),
              Text(
                ETexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ESizes.defaultBetweenSections,
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    ETexts.email,
                    style: TextStyle(
                        color:
                            dark ? EColors.thirdColor : EColors.primaryColor),
                  ),
                  prefixIcon: const Icon(Iconsax.direct_right),
                ),
              ),
              const SizedBox(
                height: ESizes.defaultBetweenSections,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.off(
                          () => const ResetPasswordScreen(),
                          transition: Transition.rightToLeftWithFade,
                          duration: Duration(milliseconds: 500)),
                      child: const Text('Submit'))),
            ],
          ),
        ),
      ),
    );
  }
}
