import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/common/widgets/custom_shape/containers/search_container.dart';
import 'package:ecom_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecom_app/common/widgets/tabbar/tabbar.dart';
import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/features/shop/screens/all_brands/all_brand.dart';
import 'package:ecom_app/features/shop/screens/all_brands/widget/brand_product.dart';
import 'package:ecom_app/features/shop/screens/store/widget/brand_card.dart';
import 'package:ecom_app/features/shop/screens/store/widget/categories_tab.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: EAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            CartCounterIcon(
              icons: const Icon(Iconsax.shopping_bag),
              onPressed: () {},
              iconColor: dark ? Colors.white : EColors.primaryColor,
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? Colors.black : Colors.white,
                expandedHeight: 440,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.all(ESizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: ESizes.defaultBetweenItem),
                        const ESearchContainer(
                          text: 'Search in stores',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: ESizes.defaultBetweenSections),
                        ESectionHeading(
                          title: 'Featured Brands',
                          onPressed: () => Get.to(() => const AllBrandScreen(),
                              transition: Transition.fadeIn,
                              duration: const Duration(milliseconds: 400)),
                        ),
                        const SizedBox(height: ESizes.defaultBetweenItem / 1.5),
                        EGridProductLayout(
                          mainAxisEvent: 70,
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return EBrandCard(
                              height: 56,
                              width: 56,
                              showBorder: true,
                              image: EImages.iconCloth,
                              onTap: () => Get.to(() => const EBrandProductScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                bottom: const ETabBar(
                  tabs: [
                    Tab(child: Text('Accessory')),
                    Tab(child: Text('Fancy')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Shoes')),
                    Tab(child: Text('Sport')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              ECategoryTab(),
              ECategoryTab(),
              ECategoryTab(),
              ECategoryTab(),
              ECategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
