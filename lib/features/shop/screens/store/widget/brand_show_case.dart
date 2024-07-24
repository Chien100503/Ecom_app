import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecom_app/features/shop/models/brand_model.dart';
import 'package:ecom_app/features/shop/screens/all_brands/widget/brand_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shape/containers/round_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'brand_card.dart';

class EBrandShowCase extends StatelessWidget {
  const EBrandShowCase({super.key, required this.images, required this.brand});

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => EBrandProductScreen(brand: brand)),
      child: ERoundContainer(
        padding: const EdgeInsets.all(ESizes.md),
        showBorder: true,
        bg: Colors.transparent,
        margin: const EdgeInsets.only(bottom: ESizes.defaultBetweenItem),
        child: Column(
          children: [
            EBrandCard(
              showBorder: false,
              height: 56,
              width: 100,
              brand: brand
            ),
            const SizedBox(height: ESizes.defaultSpace),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: images
                      .map((image) => brandTopProductImageWidget(image, context))
                      .toList()),
            )
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
        child: ERoundContainer(
      height: 100,
      padding: const EdgeInsets.all(ESizes.md),
      margin: const EdgeInsets.only(right: ESizes.sm),
      bg: EHelperFunctions.isDarkMode(context) ? Colors.grey : EColors.cardDark,
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, downloadProgress) => const EShimmerEffect(width: 100, height: 100, radius: 15),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      )
    ));
  }
}
