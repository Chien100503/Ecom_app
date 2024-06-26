import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ESocialButtons extends StatelessWidget {
  const ESocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: EColors.dark),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              fit: BoxFit.cover,
              width: ESizes.iconMd,
              height: ESizes.iconMd,
              image: AssetImage(EImages.googleLogo),
            ),
          ),
        ),
        const SizedBox(width: ESizes.defaultBetweenItem),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: EColors.dark),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              fit: BoxFit.cover,
              width: ESizes.iconMd,
              height: ESizes.iconMd,
              image: AssetImage(EImages.facebookLogo),
            ),
          ),
        ),
      ],
    );
  }
}
