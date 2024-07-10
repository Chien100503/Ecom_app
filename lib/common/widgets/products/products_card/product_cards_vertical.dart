import 'package:ecom_app/features/shop/screens/review/widget/rating_bar_star.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:ecom_app/features/shop/controllers/product_controller.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../utils/constants/enums.dart';
import '../../../style/box_shadow.dart';
import '../../custom_shape/containers/round_container.dart';
import '../../images/round_images.dart';
import '../../texts/bran_title_with_verify_icon.dart';
import '../../texts/product_title_text.dart';

class EProductCardVertical extends StatelessWidget {
  const EProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = EHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(
            () => ProductDetail(product: product),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 500),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            boxShadow: [EBoxShadow.verticalProductBoxShadow],
            borderRadius: BorderRadius.circular(ESizes.productImageRadius),
            color: dark ? EColors.accent : Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ERoundContainer(
                height: 178,
                padding: const EdgeInsets.all(ESizes.sm),
                bg: dark ? EColors.thirdColor : EColors.cardLight,
                child: Stack(
                  children: [
                    ERoundImages(
                      boxFit: BoxFit.cover,
                      imageUrl: product.thumbnail,
                      bg: Colors.transparent,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
                    ERoundContainer(
                      radius: ESizes.sm,
                      padding: const EdgeInsets.symmetric(
                          horizontal: ESizes.sm, vertical: ESizes.xs),
                      bg: EColors.accent,
                      child: Text(
                        '${controller.calculateSalePercentage(product.price, product.salePrice)}%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: EColors.thirdColor),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.withOpacity(0.3)),
                        child: const Center(
                          child: Icon(
                            Iconsax.heart5,
                            color: Colors.red,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 45,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: dark ? EColors.primaryColor.withOpacity(0.3) : EColors.accent),
                        child: const Center(
                          child: Icon(
                            Iconsax.add,
                            color: EColors.primaryColor,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: ESizes.defaultBetweenItem / 2),
              Padding(
                padding: const EdgeInsets.only(left: ESizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EProductTitleText(
                      title: product.title,
                      smallSize: true,
                    ),
                    EBrandTitleWithVerifyIcon(
                      title: product.brand?.name ?? '',
                      maxLines: 1,
                      brandTextSize: TextSizes.small,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${product.price}',
                            style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.red)
                        ),
                        const SizedBox(width: ESizes.defaultBetweenItem),
                        Text(
                          '\$${product.salePrice}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    const ERatingStar(rating: 4.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
