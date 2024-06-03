import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ELoginHeader extends StatelessWidget {
  const ELoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 150,
            image: AssetImage(dark
                ? 'assets/logos/logo_dark.png'
                : 'assets/logos/logo_light.png')),
        Text(
          ETexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: ESizes.sm,
        ),
        Text(ETexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}