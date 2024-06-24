import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/features/shop/screens/product_details/widget/bottom_navigation_detail.dart';
import 'package:ecom_app/features/shop/screens/product_details/widget/brand_product.dart';
import 'package:ecom_app/features/shop/screens/product_details/widget/description.dart';
import 'package:ecom_app/features/shop/screens/product_details/widget/option_color.dart';
import 'package:ecom_app/features/shop/screens/product_details/widget/option_size.dart';
import 'package:ecom_app/features/shop/screens/product_details/widget/product_image_slider.dart';
import 'package:ecom_app/features/shop/screens/product_details/widget/rate_and_share.dart';
import 'package:ecom_app/features/shop/screens/review/review_and_rating.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const EBottomNavigationDetail(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image product - slider
            const EProductImageSlider(),
            // Rate and share
            const ERateAndShare(),
            // Sale and price
            Padding(
              padding: const EdgeInsets.only(
                left: ESizes.defaultSpace,
                right: ESizes.defaultSpace,
                bottom: ESizes.defaultSpace,
              ),
              child: Row(
                children: [
                  Container(
                    height: 22,
                    width: 33,
                    decoration: BoxDecoration(
                      color: dark ? EColors.accent : EColors.thirdColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text('10%',
                          style: Theme.of(context).textTheme.labelSmall),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  // Price
                  Text('\$268.35 - 289.23',
                      style: Theme.of(context).textTheme.bodyLarge)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: ESizes.defaultSpace, right: ESizes.defaultSpace),
              child: Text('• Dior CD Icon Polo Shirt',
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            const SizedBox(
              height: ESizes.defaultBetweenItem,
            ),
            // Brand product
            Padding(
              padding: const EdgeInsets.only(
                left: ESizes.defaultSpace,
                right: ESizes.defaultSpace,
                bottom: ESizes.defaultSpace,
              ),
              child: Row(
                children: [
                  Text('Status: ',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text('In stock', style: Theme.of(context).textTheme.bodyLarge)
                ],
              ),
            ),
            const EBrandProduct(),

            // Options
            const EOptionColor(),
            const EOptionSize(),

            Padding(
              padding: const EdgeInsets.only(
                left: ESizes.defaultSpace,
                right: ESizes.defaultSpace,
                bottom: ESizes.defaultSpace,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Checkout'),
                ),
              ),
            ),
            const EDescription(),
            Divider(
                thickness: 1,
                color: dark ? EColors.thirdColor : EColors.primaryColor),
            const SizedBox(height: ESizes.defaultBetweenItem),
            Padding(
              padding: const EdgeInsets.only(
                left: ESizes.defaultSpace,
                right: ESizes.defaultSpace,
                bottom: ESizes.defaultSpace,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ESectionHeading(
                    title: 'Review',
                    showActionButton: false,
                  ),
                  IconButton(
                    onPressed: () => Get.to(() => const ReviewAndRating(),
                        duration: const Duration(milliseconds: 300),
                        transition: Transition.rightToLeftWithFade),
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: dark ? EColors.thirdColor : EColors.primaryColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
