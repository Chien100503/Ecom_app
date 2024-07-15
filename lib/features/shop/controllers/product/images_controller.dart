import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  // Variable
  RxString selectedProductImages = ''.obs;

  // Get all Images from product and variation
  List<String> getAllProductImages(ProductModel product) {
    Set<String> images = {};

    // load thumbnail image
    images.add(product.thumbnail);
    // assign thumbnail as selected image
    selectedProductImages.value = product.thumbnail;

    // get all images from the ProductModel if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }
    //get all images from the Product Variation if not null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  // show images popup
  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
          backgroundColor: EColors.accent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: ESizes.defaultSpace * 2,
                        horizontal: ESizes.defaultSpace),
                    child: CachedNetworkImage(

                      fit: BoxFit.fill,
                      imageUrl: image,
                    ),
                  ),
                  const SizedBox(height: ESizes.defaultBetweenItem),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () => Get.back(),
                        child: Text('Close'),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
