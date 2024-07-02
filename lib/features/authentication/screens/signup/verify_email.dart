import 'package:ecom_app/data/repositories/authentication/respositories_authentication.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/constants/texts_strings.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/verify_controller/verify_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => RepositoriesAuthentication.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Center(
                  child: Image(
                image: const AssetImage(EImages.verifyEmail),
                width: EHelperFunctions.screenWidth() * 0.6,
              )),

              const SizedBox(
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
                email ?? '',
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
                  onPressed: () => controller.checkEmailVerifyStatus(),
                  child: const Text(ETexts.eContinue),
                ),
              ),
              const SizedBox(
                height: ESizes.defaultBetweenItem,
              ),
              TextButton(
                onPressed: () => controller.sendEmailVerify(),
                child: const Text(ETexts.resendEmail),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
