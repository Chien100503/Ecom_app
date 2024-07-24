
import 'package:ecom_app/common/widgets/shimmer/shimmer_categories.dart';
import 'package:ecom_app/features/shop/controllers/categories_controller.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:ecom_app/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widget/vertical_image_text.dart';

class EHomeCategories extends StatelessWidget {
  const EHomeCategories({
    super.key, this.product,
  });

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());

    return Obx(() {
      if (controller.isLoad.value) return const EShimmerCategories();

      if (controller.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No data found',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 100,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.featuredCategories.length,
          itemBuilder: (_, index) {
            final category = controller.featuredCategories[index];
            return VerticalImageText(
              title: category.name,
              image: category.image,
              textColor: Colors.black,
              onTap: () => Get.to(() => SubCategoryScreen(category: category,),
                  transition: Transition.fadeIn,
                  duration: const Duration(milliseconds: 400),
              ),
            );
          },
        ),
      );
    });
  }
}
