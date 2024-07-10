import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/products_card/product_cards_vertical.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ESortableProducts extends StatelessWidget {
  const ESortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort),
              fillColor: EColors.thirdColor),
          onChanged: (value) {},
          items: ['Name', 'Size', 'Low Price', 'High Price', 'Sale']
              .map((option) =>
              DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: ESizes.defaultBetweenSections),
        EGridProductLayout(
          itemCount: 7,
          itemBuilder: (context, index) => EProductCardVertical(product: ProductModel.empty(),),
        )
      ],
    );
  }
}