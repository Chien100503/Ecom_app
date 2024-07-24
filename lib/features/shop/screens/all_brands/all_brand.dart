import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/features/shop/controllers/product/brand_controller.dart';
import 'package:ecom_app/features/shop/screens/all_brands/widget/brand_product.dart';
import 'package:ecom_app/features/shop/screens/store/widget/brand_card.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/shimmer/shimmer_brand.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

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
              Obx(() {
                if (controller.isLoad.value) return const ShimmerBrand();
                if (controller.featuredBrands.isEmpty) {
                  return const Center(
                    child: Text('Data not found!'),
                  );
                }
                return EGridProductLayout(
                  mainAxisEvent: 70,
                  itemCount: controller.featuredBrands.length,
                  itemBuilder: (_, index) {
                    final brand = controller.featuredBrands[index];
                    return EBrandCard(
                      brand: brand,
                      height: 56,
                      width: 56,
                      showBorder: true,
                      onTap: () =>
                          Get.to(() => EBrandProductScreen(brand: brand,)),
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
