import 'package:ecom_app/common/widgets/products/products_card/product_cards_vertical.dart';
import 'package:ecom_app/features/shop/screens/all_product/all_product.dart';
import 'package:ecom_app/features/shop/screens/home/widget/home_appbar.dart';
import 'package:ecom_app/features/shop/screens/home/widget/home_categories.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shape/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shape/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/images_strings.dart';
import 'widget/home_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const EPrimaryHeaderContainer(
              child: Column(
                children: [
                  // App bar
                  EHomeAppBar(),
                  SizedBox(height: ESizes.defaultBetweenSections),
                  // SearchBar
                  ESearchContainer(text: 'Search in Store'),
                  SizedBox(height: ESizes.defaultBetweenSections),
                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: ESizes.defaultSpace),
                    child: Column(
                      children: [
                        // Heading
                        ESectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: EColors.textPrimary,
                        ),
                        SizedBox(height: ESizes.defaultBetweenItem),

                        // Categories
                        EHomeCategories()
                      ],
                    ),
                  ),
                  SizedBox(height: ESizes.defaultBetweenItem)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  const ESlider(),
                  const SizedBox(height: ESizes.defaultBetweenItem),
                  // Popular text -view all
                  ESectionHeading(
                    title: 'Popular products',
                    onPressed: () => Get.to(() => const AllProductScreen(),
                        transition: Transition.fadeIn,
                        duration: const Duration(milliseconds: 400)),
                  ),
                  const SizedBox(height: ESizes.defaultBetweenItem),
                  // EProductCardVertical()
                  EGridProductLayout(
                    itemBuilder: (_, index) => const EProductCardVertical(),
                    itemCount: 6,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
