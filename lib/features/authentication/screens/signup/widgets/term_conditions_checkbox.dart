import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts_strings.dart';

class termConditionsCheckbox extends StatelessWidget {
  const termConditionsCheckbox({super.key});


  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(checkColor: EColors.primaryColor ,value: true, onChanged: (value) {})),
        const SizedBox(
          width: ESizes.defaultBetweenItem,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${ETexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: '${ETexts.privacyPolicy}',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? Colors.white : EColors.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: dark ? EColors.light : EColors.primaryColor),
          ),
          TextSpan(text: ' and ', style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: '${ETexts.termOfUse}',
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
