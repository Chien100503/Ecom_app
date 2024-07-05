import 'package:ecom_app/common/widgets/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../utils/constants/sizes.dart';

class ECircleImage extends StatelessWidget {
  const ECircleImage(
      {super.key,
        this.width = 56,
        this.height = 56,
        this.padding = ESizes.sm,
      this.boxFit = BoxFit.cover,
      required this.image,
      this.isNetworkImage = false,
      this.overlayColor,
      this.bg});

  final double height, width, padding;
  final BoxFit? boxFit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? bg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: bg
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage ?
              CachedNetworkImage (
                fit: boxFit,
                color: overlayColor,
                imageUrl: image,
                progressIndicatorBuilder: (context, url, downloadProgress) => const EShimmerEffect(width: 55, height: 55, radius: 15),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ) : Image(
              fit: boxFit,
              color: overlayColor,
              image: isNetworkImage
                  ? NetworkImage(image)
                  : AssetImage(image) as ImageProvider),
        ),
      ),
    );
  }
}
