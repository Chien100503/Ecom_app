import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/common/widgets/loader/animation_loader_widget.dart';
import 'package:ecom_app/common/widgets/products/cart/cart_items.dart';
import 'package:ecom_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecom_app/navigation_menu.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../payment/payment.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: EAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Obx(
          () {
            final emptyWidget = EAnimationLoaderWidget(
              text: 'Whoops!, Cart is empty', animation: EImages.loaderAnimation,
              showAction: true,
              actionText: 'Let\'s fill it',
              onActionPress: () =>  Get.off(() => const NavigationMenu()),
            );

            if (controller.cartItems.isEmpty) {
              return emptyWidget;
            } else {
              return const SingleChildScrollView(
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                padding: EdgeInsets.all(ESizes.defaultSpace),
                child: ECartItems(),
              );
            }
          },
      ),
      bottomNavigationBar: controller.cartItems.isEmpty ? const SizedBox() : Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
                () => const PaymentScreen(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 400),
          ),
          child: Obx(()=> Text('Checkout \$${controller.totalCartPrice.value.toStringAsFixed(2)}')),
        ),
      ),
    );
  }
}
