import 'package:ecom_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class EBrandTitleText extends StatelessWidget {
  const EBrandTitleText({
    super.key,
    required this.title,
    required this.maxLines,
    this.color,
    this.textAlign,
    required this.brandTextSize,
  });

  final String title;
  final int maxLines;
  final Color? color;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
