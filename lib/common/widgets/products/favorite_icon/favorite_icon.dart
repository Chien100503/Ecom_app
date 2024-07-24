import 'package:ecom_app/features/shop/controllers/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EFavoriteIcon extends StatelessWidget {
  const EFavoriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    return Obx(
          () => InkWell(
        onTap: () async => await controller.toggleFavoriteProduct(productId),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey.withOpacity(0.3)),
          child: Center(
            child: Icon(
              controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
              color: controller.isFavorite(productId) ? Colors.red : null,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}
