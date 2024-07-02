import 'package:ecom_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts_strings.dart';

class ETermConditionsCheckbox extends StatelessWidget {
  const ETermConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = EHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(width: ESizes.defaultBetweenItem / 2),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${ETexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: ETexts.privacyPolicy,
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? Colors.white : EColors.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: dark ? EColors.light : EColors.primaryColor),
          ),
          TextSpan(text: ' and ', style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: ETexts.termOfUse,
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? Colors.white : EColors.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: dark ? EColors.light : EColors.primaryColor),
          ),
        ])),
      ],
    );
  }
}
