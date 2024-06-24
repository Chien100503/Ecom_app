import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';

class EBrandProduct extends StatelessWidget {
  const EBrandProduct({
    super.key
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
      child: Container(
        height: 35,
        width: 67,
        decoration: BoxDecoration(
          color: dark ? EColors.accent : EColors.thirdColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dior', style: Theme.of(context).textTheme.bodyLarge,),
              const Icon(Iconsax.verify5, size: 20, color: Colors.blueAccent,)
            ],
          ),
        ),
      ),
    );
  }
}