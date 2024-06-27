import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import 'brand_title_text.dart';

class EBrandTitleWithVerifyIcon extends StatelessWidget {
  const EBrandTitleWithVerifyIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor,
    this.textAlign,
    this.brandTextSize,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes? brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: EBrandTitleText(
            title: title,
            color: textColor,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
            maxLines: maxLines,
          ),
        ),
        const SizedBox(width: 5),
        const Icon(
          Iconsax.verify5,
          color: Colors.blue,
          size: ESizes.iconXs,
        )
      ],
    );
  }
}
