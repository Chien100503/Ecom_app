import 'package:ecom_app/common/widgets/success_screen/success_screen.dart';
import 'package:ecom_app/features/authentication/screens/loggin/login.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/constants/texts_strings.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(const LoginScreen()),
              icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Center(
                  child: Image(
                image: AssetImage(EImages.verifyEmail),
                width: EHelperFunctions.screenWidth() * 0.6,
              )),

              SizedBox(
                height: ESizes.defaultBetweenSections,
              ),
              // Title and subtitle
              Text(
                ETexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ESizes.defaultBetweenItem,
              ),
              Text(
                'Support: chienhx03@.dev@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ESizes.defaultBetweenItem,
              ),
              Text(
                ETexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ESizes.defaultBetweenSections,
              ),
              // Button

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(
                    () => SuccessScreen(
                      image: EImages.success,
                      title: ETexts.yourAccountCreateTitle,
                      subTitle: ETexts.yourAccountCreateSubTitle,
                      onPressed: () => Get.to(
                        () => const LoginScreen(),
                        transition: Transition.rightToLeftWithFade,
                        duration: Duration(milliseconds: 500),
                      ),
                    ),
                  ),
                  child: const Text(ETexts.eContinue),
                ),
              ),
              SizedBox(
                height: ESizes.defaultBetweenItem,
              ),
              TextButton(onPressed: () {}, child: Text(ETexts.resendEmail)),
            ],
          ),
        ),
      ),
    );
  }
}
