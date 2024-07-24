import 'package:ecom_app/common/widgets/shimmer/shimmer_boxes.dart';
import 'package:ecom_app/common/widgets/shimmer/shimmer_list_title.dart';
import 'package:ecom_app/features/shop/controllers/product/brand_controller.dart';
import 'package:ecom_app/features/shop/models/categories_model.dart';
import 'package:ecom_app/features/shop/screens/store/widget/brand_show_case.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class CategoryBrand extends StatelessWidget {
  const CategoryBrand({super.key, required this.category});

  final CategoryModels category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandForProduct(category.id),
      builder: (context, snapshot) {
        const loader = Column(
          children: [
            ShimmerListTitle(),
            SizedBox(height: ESizes.defaultBetweenItem),
            ShimmerBoxes(),
            SizedBox(height: ESizes.defaultBetweenItem),
          ],
        );
        final widget = CloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot, loader: loader);
        if (widget != null) return widget;

        //Record found!
        final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProduct(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {
                final widget = CloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                if (widget != null) return widget;

                // Record found!
                final products = snapshot.data!;

                return EBrandShowCase(
                  brand: brand,
                  images: products.map((e) => e.thumbnail).toList(),
                );
              },
            );
          },
        );
      },
    );
  }
}
