import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/common/widgets/loader/animation_loader_widget.dart';
import 'package:ecom_app/common/widgets/products/cart/cart_items.dart';
import 'package:ecom_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecom_app/navigation_menu.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shop/models/cart_item_model.dart';
import '../payment/payment.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isEditing = false;
  final Set<CartItemModel> selectedItems = {};

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
        actions: [
          TextButton(
            child: Text(isEditing ? 'Done' : 'Select All', style: Theme.of(context).textTheme.bodyMedium,),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
                selectedItems.clear();
              });
            },
          ),
        ],
      ),
      body: Obx(
            () {
          final emptyWidget = EAnimationLoaderWidget(
            text: 'Whoops!, Cart is empty',
            animation: EImages.loaderAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPress: () => Get.off(() => const NavigationMenu()),
          );

          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              padding: const EdgeInsets.all(ESizes.defaultSpace),
              child: ECartItems(
                isEditing: isEditing,
                selectedItems: selectedItems,
              ),
            );
          }
        },
      ),
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (isEditing)
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    controller.removeSelectedItems(selectedItems);
                    setState(() {
                      selectedItems.clear();
                      isEditing = false;
                    });
                  },
                  child: const Text('Delete Selected'),
                ),
              ),
            if (isEditing)
              const SizedBox(width: 8),
            if (isEditing)
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    controller.clearCart();
                    setState(() {
                      selectedItems.clear();
                      isEditing = false;
                    });
                  },
                  child: const Text('Delete All'),
                ),
              ),
            if (!isEditing)
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.to(
                        () => const PaymentScreen(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 400),
                  ),
                  child: Obx(() => Text(
                      'Checkout \$${controller.totalCartPrice.value.toStringAsFixed(2)}')),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
