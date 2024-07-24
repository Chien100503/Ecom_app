import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';

import '../../models/product_model.dart';

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
    // get all images from the Product Variation if not null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  // show images popup
  void showEnlargedImage(List<String> images, int initialIndex) {
    final TransformationController controller = TransformationController();
    TapDownDetails? doubleTapDetails;
    bool isZoomed = false;
    final PageController pageController = PageController(initialPage: initialIndex);

    Get.to(
          () => Scaffold(
        backgroundColor: EColors.accent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onDoubleTapDown: (details) {
                  doubleTapDetails = details;
                },
                onDoubleTap: () {
                  final double scale = isZoomed ? 1 : 3;
                  final position = doubleTapDetails!.localPosition;
                  final double x = -position.dx * (scale - 1);
                  final double y = -position.dy * (scale - 1);
                  controller.value = Matrix4.identity()
                    ..translate(x, y)
                    ..scale(scale);
                  isZoomed = !isZoomed;
                },
                child: PageView.builder(
                  controller: pageController,
                  itemCount: images.length,
                  itemBuilder: (_, index) {
                    return InteractiveViewer(
                      transformationController: controller,
                      child: CachedNetworkImage(
                        imageUrl: images[index],
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: ESizes.defaultBetweenItem),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Close'),
                ),
              ),
            ),
            const SizedBox(height: ESizes.defaultBetweenItem),
          ],
        ),
      ),
    );
  }
}
