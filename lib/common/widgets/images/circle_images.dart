import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


import '../../../utils/constants/sizes.dart';

class ECircleImage extends StatelessWidget {
  const ECircleImage(
      {super.key,
      required this.height,
      required this.width,
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
    final dark = EHelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: dark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
          fit: boxFit,
          color: overlayColor,
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider),
    );
  }
}
