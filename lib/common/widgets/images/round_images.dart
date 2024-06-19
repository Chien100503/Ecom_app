import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ERoundImages extends StatelessWidget {
  const ERoundImages(
      {super.key,
      this.width,
      this.height,
      required this.imageUrl,
      this.applyImageRadius = true,
      this.border,
      required this.bg,
      this.boxFit = BoxFit.contain,
      this.padding,
      this.isNetworkImage = false,
      this.onPressed,
      this.radius = ESizes.md});

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color bg;
  final BoxFit boxFit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: bg,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(radius)
              : BorderRadius.zero,
          child: Image(
              fit: boxFit,
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider),
        ),
      ),
    );
  }
}
