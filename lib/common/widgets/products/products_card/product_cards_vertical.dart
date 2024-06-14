import 'package:ecom_app/common/style/box_shadow.dart';
import 'package:ecom_app/common/widgets/custom_shape/containers/round_container.dart';
import 'package:ecom_app/common/widgets/images/round_images.dart';
import 'package:ecom_app/common/widgets/texts/product_title_text.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EProductCardVertical extends StatelessWidget {
  const EProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            boxShadow: [EBoxShadow.verticalProductBoxShadow],
            borderRadius: BorderRadius.circular(ESizes.productImageRadius),
            color: dark ? EColors.darkGrey : Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ERoundContainer(
                height: 180,
                padding: const EdgeInsets.all(ESizes.sm),
                bg: dark ? EColors.cardDark : EColors.cardLight,
                child: Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: ERoundImages(
                        imageUrl: EImages.product1,
                        bg: Colors.transparent,
                        applyImageRadius: true,
                      ),
                    ),
                    ERoundContainer(
                      radius: ESizes.sm,
                      padding: const EdgeInsets.symmetric(
                          horizontal: ESizes.sm, vertical: ESizes.xs),
                      bg: EColors.accent,
                      child: Text(
                        '20%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: EColors.thirdColor),
                      ),
                    ),

                    // Wishlist button
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
                  ],
                ),
              ),
              const SizedBox(height: ESizes.defaultBetweenItem / 2),
              Padding(
                padding: const EdgeInsets.only(left: ESizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EProductTitleText(
                      title: 'Dior CD Icon Polo Shirt',
                      smallSize: true,
                    ),
                    Row(
                      children: [
                        Text(
                          'Dior',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Iconsax.verify5,
                          color: Colors.blue,
                          size: ESizes.iconXs,
                        )
                      ],
                    ),
                    Text(
                      '\$500',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(Iconsax.star1, color: Color(0xffEDB310)),
                            Icon(Iconsax.star1, color: Color(0xffEDB310)),
                            Icon(Iconsax.star1, color: Color(0xffEDB310)),
                            Icon(Iconsax.star1, color: Color(0xffEDB310)),
                            Icon(Icons.star_half, color: Color(0xffEDB310)),
                            SizedBox(width: 10),
                          ],
                        ),

                        Container(
                          height: 37,
                          width: 30,
                          decoration: const BoxDecoration(
                            color: EColors.dark,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(ESizes.cardRadiusMd),
                            ),
                          ),
                          child: const Icon(
                            Iconsax.add,
                            color: EColors.thirdColor,
                          ),
                        )
                      ],
                    ),
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
