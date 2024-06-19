import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ESearchContainer extends StatelessWidget {
  const ESearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: ESizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: EDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(ESizes.md),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ESizes.borderRadiusLg),
            border: showBorder ? Border.all(color: EColors.accent) : null),
        child: Row(
          children: [
            const Icon(Iconsax.search_normal, color: EColors.accent),
            const SizedBox(width: ESizes.defaultBetweenItem),
            Text(
              text,
              style: TextStyle(
                  color: dark ? EColors.accent : EColors.primaryColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
