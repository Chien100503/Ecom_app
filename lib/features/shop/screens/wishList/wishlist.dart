import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_app/common/widgets/loader/animation_loader.dart';
import 'package:ecom_app/common/widgets/products/products_card/product_cards_vertical.dart';
import 'package:ecom_app/common/widgets/shimmer/vertical_product_card_shimmer.dart';
import 'package:ecom_app/features/checkout/cart/cart.dart';
import 'package:ecom_app/features/shop/controllers/favorite_controller.dart';
import 'package:ecom_app/navigation_menu.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  Future<void> _refreshFavorites() async {
    final controller = FavoriteController.instance;
    await controller.initFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final controller = FavoriteController.instance;
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
                duration: const Duration(milliseconds: 400)),
            icon: const Icon(Iconsax.shopping_cart),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshFavorites,
        child: Obx(() {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(ESizes.defaultSpace),
              child: FutureBuilder(
                future: controller.favoriteProduct(),
                builder: (context, snapshot) {
                  final emptyWidget = EAnimationLoader(
                    text: 'Whoops! Wishlist is empty...',
                    animation: EImages.loaderAnimationOne,
                    showAction: true,
                    actionText: 'Let\'s add some',
                    actionButtonAnimation: () => Get.off(
                          () => const NavigationMenu(),
                    ),
                  );

                  const loader = EVerticalProductCardShimmer(itemCount: 6);
                  final widget = CloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                      nothingFound: emptyWidget);
                  if (widget != null) return widget;

                  final product = snapshot.data!;
                  return EGridProductLayout(
                    itemCount: product.length,
                    itemBuilder: (_, index) => EProductCardVertical(
                      product: product[index],
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
