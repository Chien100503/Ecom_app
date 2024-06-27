import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_app/features/checkout/cart/cart.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/products/products_card/product_cards_vertical.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(const CartScreen(),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 400)
            ),
            icon: const Icon(Iconsax.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              EGridProductLayout(
                  itemCount: 5,
                  itemBuilder: (_, index) => const EProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
