import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/features/shop/screens/all_brands/widget/brand_product.dart';
import 'package:ecom_app/features/shop/screens/store/widget/brand_card.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../utils/constants/images_strings.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        title: Text(
          'All Brand',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              const ESectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: ESizes.defaultBetweenItem),
              EGridProductLayout(
                mainAxisEvent: 70,
                itemCount: 10,
                itemBuilder: (_, index) => EBrandCard(
                  height: 56,
                  width: 56,
                  showBorder: true,
                  image: EImages.shoesIcon,
                  onTap: () => Get.to(() => const EBrandProductScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
