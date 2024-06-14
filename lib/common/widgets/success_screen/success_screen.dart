import 'package:ecom_app/common/style/spacing_styles.dart';
import 'package:ecom_app/features/authentication/screens/loggin/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: ESpacingStyle.paddingWithAppBarHeight * 2,
        child: Column(
          children: [
            // Image
            Center(child: Image(image: AssetImage(image), width: EHelperFunctions.screenWidth() * 0.6,)),

            const SizedBox(height: ESizes.defaultBetweenSections,),
            // Title and subtitle
            Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: ESizes.defaultBetweenItem,),
            Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
            const SizedBox(height: ESizes.defaultBetweenSections,),

            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const LoginScreen()), child: const Text(ETexts.eContinue))),
          ],
        ),
      ),
    );
  }
}
