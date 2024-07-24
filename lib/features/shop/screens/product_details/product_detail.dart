import 'package:ecom_app/common/widgets/images/circle_images.dart';
import 'package:ecom_app/common/widgets/products/products_card/product_price.dart';
import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/features/shop/controllers/product/product_controller.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:ecom_app/features/shop/screens/product_details/widget/bottom_navigation_detail.dart';
import 'package:ecom_app/features/shop/screens/product_details/widget/description.dart';
import 'package:ecom_app/features/shop/screens/product_details/widget/product_attributes.dart';
import 'package:ecom_app/features/shop/screens/product_details/widget/product_image_slider.dart';
import 'package:ecom_app/features/shop/screens/product_details/widget/rate_and_share.dart';
import 'package:ecom_app/features/shop/screens/review/review_and_rating.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/enums.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const EBottomNavigationDetail(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image product - slider
            EProductImageSlider(product: product),
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
                      child: Text('$salePercentage%',
                          style: Theme.of(context).textTheme.labelSmall),
                    ),
                  ),
                  const SizedBox(width: ESizes.defaultBetweenItem),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  const SizedBox(width: ESizes.defaultSpace),
                  EProductPrice(price: controller.getProductPrice(product)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: ESizes.defaultSpace, right: ESizes.defaultSpace),
              child: Text('• ${product.title}',
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
                  Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.bodyLarge)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: ESizes.defaultSpace,
                right: ESizes.defaultSpace,
                bottom: ESizes.defaultSpace,
              ),
              child: Row(
                children: [
                  ECircleImage(image: product.brand != null ? product.brand!.image : '', isNetworkImage: true, bg: EColors.thirdColor,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.brand != null ? product.brand!.name : '', style: Theme.of(context).textTheme.bodyLarge,),
                        const Icon(Iconsax.verify5, size: 20, color: Colors.blueAccent,)
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: ESizes.defaultSpace,
                right: ESizes.defaultSpace,
                bottom: ESizes.defaultSpace,
              ),
              child: EProductAttributes(product: product),
            ),
            // Options
            if(product.productType == ProductType.variable.toString())

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
            EDescription(description: product.description ?? '',),

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
