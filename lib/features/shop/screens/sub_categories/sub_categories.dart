import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/common/widgets/images/round_images.dart';
import 'package:ecom_app/common/widgets/products/products_card/product_cards_horizontal.dart';
import 'package:ecom_app/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/features/shop/controllers/categories_controller.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:ecom_app/features/shop/screens/all_product/all_product.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/categories_model.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});

  final CategoryModels category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoriesController.instance;
    return Scaffold(
      appBar: EAppBar(
        title: Text(
          category.name,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              const ERoundImages(
                imageUrl: EImages.banner2,
                bg: Colors.transparent,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const SizedBox(height: ESizes.defaultBetweenSections),
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {
                  const loader = EHorizontalProductShimmer();
                  final widget = CloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  final subCategories = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {

                      final subCategory = subCategories[index];

                      return FutureBuilder(
                        future: controller.getCategoryProduct(categoryId: subCategory.id),
                        builder: (context, snapshot) {
                          final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                          if (widget != null) return widget;

                          final product = snapshot.data!;
                          return Column(
                            children: [
                              ESectionHeading(
                                title: subCategory.name,
                                titleButton: 'View all',
                                onPressed: () => Get.to(
                                  () => AllProductScreen(
                                    title: subCategory.name,
                                    futureMethod: controller.getCategoryProduct(
                                        categoryId: subCategory.id, limit: -1),
                                  ),
                                ),
                              ),
                              const SizedBox(height: ESizes.defaultBetweenItem / 2),
                              SizedBox(
                                height: 121,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (_, __) => const SizedBox(
                                      width: ESizes.defaultBetweenItem),
                                  itemCount: product.length,
                                  itemBuilder: (context, index) =>
                                      EProductCardsHorizontal(product: product[index],),
                                ),
                              )
                            ],
                          );
                        }
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
