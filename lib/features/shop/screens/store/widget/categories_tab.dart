import 'package:ecom_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_app/common/widgets/products/products_card/product_cards_vertical.dart';
import 'package:ecom_app/common/widgets/shimmer/vertical_product_card_shimmer.dart';
import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/features/shop/controllers/categories_controller.dart';
import 'package:ecom_app/features/shop/models/categories_model.dart';
import 'package:ecom_app/features/shop/screens/all_product/all_product.dart';
import 'package:ecom_app/features/shop/screens/store/widget/category_brand.dart';
import 'package:ecom_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';

class ECategoryTab extends StatelessWidget {
  const ECategoryTab({super.key, required this.category});

  final CategoryModels category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoriesController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              // Brands
              CategoryBrand(category: category),

              FutureBuilder(
                  future:
                      controller.getCategoryProduct(categoryId: category.id),
                  builder: (context, snapshot) {
                    final response = CloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: const EVerticalProductCardShimmer());
                    if (response != null) return response;
                    final products = snapshot.data!;

                    return Column(
                      children: [
                        ESectionHeading(
                          title: 'You might like',
                          onPressed: () => Get.to(
                            () => AllProductScreen(
                              title: category.name,
                              futureMethod: controller.getCategoryProduct(
                                  categoryId: category.id, limit: 10),
                            ),
                          ),
                        ),
                        EGridProductLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) =>
                              EProductCardVertical(product: products[index]),
                        )
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
