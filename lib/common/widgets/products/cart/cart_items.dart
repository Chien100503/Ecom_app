import 'package:ecom_app/common/widgets/products/cart/product_quantity.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../products_card/product_price.dart';
import 'cat_item.dart';

class ECartItems extends StatelessWidget {
  const ECartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      separatorBuilder: (_, __) =>
          const SizedBox(height: ESizes.defaultBetweenSections),
      itemBuilder: (_, index) => Column(
        children: [
          const ECartItem(),
          if (showAddRemoveButton) const SizedBox(height: ESizes.defaultBetweenItem),
          if (showAddRemoveButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70),
                    EProductQuantityWithAddRemoveButton(),
                  ],
                ),
                EProductPrice(price: '100')
              ],
            )
        ],
      ),
    );
  }
}
