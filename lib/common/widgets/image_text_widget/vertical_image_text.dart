import 'package:ecom_app/common/widgets/images/circle_images.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.title,
    required this.image,
    this.textColor = EColors.light,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
    this.width = 56,
    this.height = 56,
    this.padding = ESizes.sm,
  });

  final double width, height, padding;
  final String title, image;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ESizes.defaultBetweenItem),
        child: Column(
          children: [
            ECircleImage(
              image: image,
              boxFit: BoxFit.fitWidth,
              isNetworkImage: isNetworkImage,
              bg: dark ? Colors.black : Colors.white,
              overlayColor: dark ? EColors.thirdColor : EColors.primaryColor,
            ),
            // Text
            const SizedBox(height: ESizes.defaultBetweenItem / 2),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
