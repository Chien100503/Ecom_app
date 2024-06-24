import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ERateAndShare extends StatelessWidget {
  const ERateAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: ESizes.defaultSpace,
        right: ESizes.defaultSpace,
        bottom: ESizes.defaultSpace,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Iconsax.star5, color: Colors.amber, size: 24),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: ' (98)', style: Theme.of(context).textTheme.bodyLarge)
              ])),
            ],
          ),
          Icon(
            Icons.share,
            size: 24,
            color: dark ? EColors.thirdColor : EColors.primaryColor,
          )
        ],
      ),
    );
  }
}
