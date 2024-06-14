import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class EBannerImage extends StatelessWidget {
  const EBannerImage({
    super.key,
    this.width = 150,
    this.height = 158,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.background = EColors.light,
    this.padding,
    this.isNetworkImage = false,
    this.onPress,
    this.borderRadius = ESizes.md,
    this.boxFit = BoxFit.contain,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color background;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPress;
  final double borderRadius;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(ESizes.md)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}