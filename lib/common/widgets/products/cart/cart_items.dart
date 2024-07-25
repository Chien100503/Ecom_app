import 'package:ecom_app/common/widgets/products/cart/product_quantity.dart';
import 'package:ecom_app/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cartController.cartItems.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: ESizes.defaultBetweenSections),
          itemBuilder: (_, index) => Obx(() {
                final item = cartController.cartItems[index];
                return Column(
                  children: [
                    ECartItem(cartItem: item),
                    if (showAddRemoveButton)
                      const SizedBox(height: ESizes.defaultBetweenItem),
                    if (showAddRemoveButton)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 70),
                              EProductQuantityWithAddRemoveButton(
                                quantity: item.quantity,
                                add: () => cartController.addOneToCart(item),
                                remove: () =>
                                    cartController.removeOneFromCart(item),
                              ),
                            ],
                          ),
                          EProductPrice(price: (item.price * item.quantity).toStringAsFixed(1)),
                        ],
                      )
                  ],
                );
              })),
    );
  }
}
