import 'package:ecom_app/common/widgets/custom_shape/circle_icon.dart';
import 'package:ecom_app/common/widgets/custom_shape/containers/round_container.dart';
import 'package:ecom_app/common/widgets/images/round_images.dart';
import 'package:ecom_app/common/widgets/products/products_card/product_price.dart';
import 'package:ecom_app/common/widgets/texts/bran_title_with_verify_icon.dart';
import 'package:ecom_app/common/widgets/texts/brand_title_text.dart';
import 'package:ecom_app/utils/constants/enums.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class EProductCardsHorizontal extends StatelessWidget {
  const EProductCardsHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ESizes.productImageRadius),
          color: dark ? EColors.accent : EColors.thirdColor ,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ERoundContainer(
              height: 120,
              bg: dark ? EColors.thirdColor : EColors.accent,
              padding: const EdgeInsets.all(ESizes.sm),
              child: Stack(
                children: [
                  const ERoundImages(
                      height: 120,
                      width: 120,
                      applyImageRadius: true,
                      imageUrl: EImages.product4,
                      bg: Colors.transparent),
                  ERoundContainer(
                    radius: ESizes.sm,
                    bg: EColors.secondary.withOpacity(0.4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: ESizes.sm, vertical: ESizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: EColors.primaryColor),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: ECircleIcon(
                      height: 40,
                      width: 40,
                      bg: Colors.grey.withOpacity(0.4),
                      icon: Iconsax.heart5,
                      border: Border.all(color: Colors.transparent, width: 1),
                      size: 25,
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(ESizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EBrandTitleText(
                      title: 'Blue Shoes',
                      brandTextSize: TextSizes.medium,
                    ),
                    const SizedBox(height: ESizes.defaultBetweenItem / 2),
                    const EBrandTitleWithVerifyIcon(title: 'Nike'),
                    const SizedBox(height: ESizes.defaultBetweenItem),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const EProductPrice(price: '180'),
                        Container(
                          height: 37,
                          width: 30,
                          decoration: const BoxDecoration(
                            color: EColors.dark,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Colors.grey,
                                offset: Offset(0, 4),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(
                                  ESizes.productImageRadius,
                                )),
                          ),
                          child: const Icon(Iconsax.add, color: EColors.thirdColor),
                        )
                      ],
                    )
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
