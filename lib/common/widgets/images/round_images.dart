import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ERoundImages extends StatelessWidget {
  const ERoundImages({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    required this.bg,
    this.boxFit = BoxFit.cover,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.radius = ESizes.md,
    this.boxShadow,
  });

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
  final BoxShadow? boxShadow;

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
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: boxFit,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      EShimmerEffect(
                          width: width ?? double.infinity,
                          height: height ?? 158,
                          radius: radius),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(image: AssetImage(imageUrl), fit: boxFit),
        ),
      ),
    );
  }
}
