import 'package:ecom_app/features/shop/controllers/product/all_product_controller.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/products_card/product_cards_vertical.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ESortableProducts extends StatelessWidget {
  const ESortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort),
              fillColor: EColors.thirdColor),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          items: ['Name','High Price', 'Low Price', 'Newest', 'Sale']
              .map((option) =>
              DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: ESizes.defaultBetweenSections),
        Obx(
          ()=> EGridProductLayout(
            itemCount: controller.products.length,
            itemBuilder: (context, index) => EProductCardVertical(product: controller.products[index]),
          ),
        )
      ],
    );
  }
}