import 'package:ecom_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_app/common/widgets/products/products_card/product_cards_vertical.dart';
import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/features/shop/models/categories_model.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import 'brand_show_case.dart';

class ECategoryTab extends StatelessWidget {
  const ECategoryTab({super.key, required this.categoryModels});

  final CategoryModels categoryModels;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              // Brands
              const EBrandShowCase(
                images: [EImages.product1, EImages.product5, EImages.product7],
              ),
              const EBrandShowCase(
                images: [EImages.product1, EImages.product5, EImages.product7],
              ),
              // Products
              ESectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),
              EGridProductLayout(
                itemCount: 4,
                itemBuilder: (_, index) => EProductCardVertical(product: ProductModel.empty()),
              )
            ],
          ),
        ),
      ],
    );
  }
}
