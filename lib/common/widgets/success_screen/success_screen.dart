import 'package:ecom_app/common/style/spacing_styles.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

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
            // Center(child: Image(image: AssetImage(image), width: EHelperFunctions.screenWidth() * 0.6,)),
            Center(
                child: Lottie.asset(image,
                    width: EHelperFunctions.screenWidth() * 0.6,
                    repeat: false)),

            const SizedBox(
              height: ESizes.defaultBetweenSections,
            ),
            // Title and subtitle
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: ESizes.defaultBetweenItem,
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: ESizes.defaultBetweenSections,
            ),

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed, child: const Text(ETexts.eContinue))),
          ],
        ),
      ),
    );
  }
}
