import 'package:ecom_app/common/widgets/custom_shape/containers/round_container.dart';
import 'package:ecom_app/common/widgets/images/round_images.dart';
import 'package:ecom_app/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:ecom_app/common/widgets/products/products_card/product_price.dart';
import 'package:ecom_app/common/widgets/texts/bran_title_with_verify_icon.dart';
import 'package:ecom_app/common/widgets/texts/brand_title_text.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:ecom_app/utils/constants/enums.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class EProductCardsHorizontal extends StatelessWidget {
  const EProductCardsHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = EHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(product: product),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 500),),
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ESizes.productImageRadius),
          color: dark ? EColors.accent : EColors.thirdColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ERoundContainer(
              height: 120,
              bg: dark ? EColors.thirdColor : EColors.cardLight,
              padding: const EdgeInsets.all(ESizes.sm),
              child: Stack(
                children: [
                  ERoundImages(
                    height: 90,
                    width: 90,
                    boxFit: BoxFit.contain,
                    applyImageRadius: true,
                    isNetworkImage: true,
                    imageUrl: product.thumbnail,
                    bg: Colors.transparent,
                  ),
                  ERoundContainer(
                    radius: ESizes.sm,
                    bg: EColors.secondary.withOpacity(0.4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: ESizes.sm,
                      vertical: ESizes.xs,
                    ),
                    child: Text(
                      '$salePercentage%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: EColors.thirdColor),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: EFavoriteIcon(
                      productId: product.id,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(ESizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EBrandTitleText(
                      title: product.title,
                      brandTextSize: TextSizes.medium,
                    ),
                    const SizedBox(height: ESizes.defaultBetweenItem / 2),
                    EBrandTitleWithVerifyIcon(title: product.brand!.name),
                    const SizedBox(height: ESizes.defaultBetweenItem /2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                                Padding(
                                  padding: const EdgeInsets.only(left: ESizes.sm),
                                  child: Text(product.price.toString()),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(left: ESizes.sm),
                                child: EProductPrice(
                                  price: controller.getProductPrice(product),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: dark ? EColors.thirdColor : EColors.accent,
                            borderRadius: BorderRadius.all(Radius.circular(100))
                          ),
                          child: SizedBox(
                            width: ESizes.iconLg * 1.2,
                            height: ESizes.iconLg * 1.2,
                            child: Icon(Iconsax.add, color: dark ? EColors.primaryColor : EColors.thirdColor,),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
