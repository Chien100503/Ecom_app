import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_app/features/shop/controllers/product/images_controller.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shape/curved_edges/curved_edge_widget.dart';
import '../../../../../common/widgets/images/round_images.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class EProductImageSlider extends StatelessWidget {
  const EProductImageSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return ECurvedEdgeWidget(
      child: Container(
        color: dark ? Colors.white70 : Colors.blueGrey.withOpacity(0.5),
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(ESizes.productImageRadius * 2),
                child: Center(
                  child: Obx(
                    () {
                      final image = controller.selectedProductImages.value;
                      return GestureDetector(
                        onTap: () => controller.showEnlargedImage(image),
                        child: CachedNetworkImage(
                          imageUrl: image,
                          progressIndicatorBuilder: (_, __, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                  color: EColors.primaryColor),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 25,
              left: ESizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: images.length,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: ESizes.defaultBetweenItem,
                  ),
                  itemBuilder: (_, index) => Obx(
                    () {
                      final imageSelected =
                          controller.selectedProductImages.value ==
                              images[index];
                      return ERoundImages(
                        boxFit: BoxFit.contain,
                        border: Border.all(
                            color: imageSelected
                                ? EColors.primaryColor
                                : Colors.transparent),
                        width: 80,
                        isNetworkImage: true,
                        imageUrl: images[index],
                        padding: const EdgeInsets.all(ESizes.sm),
                        bg: Colors.white60,
                        onPressed: () => controller
                            .selectedProductImages.value = images[index],
                      );
                    },
                  ),
                ),
              ),
            ),
            EAppBar(
              showBackArrow: true,
              actions: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: const Center(
                    child: Icon(
                      Iconsax.heart5,
                      color: Colors.red,
                      size: 28,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
