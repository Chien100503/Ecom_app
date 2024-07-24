import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecom_app/features/shop/controllers/banner_controller.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/images/banner_image.dart';

class ESlider extends StatelessWidget {
  const ESlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        if (controller.isLoad.value) return const EShimmerEffect(width: double.infinity, height: 190, radius: 15);

        if (controller.banners.isEmpty) {
          return const Center(child: Text('No data found!'));
        } else {
          return Column(
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                      onPageChanged: (index, _) =>
                          controller.updatePageIndicator(index),
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      enlargeCenterPage: true,
                      autoPlayCurve: Curves.fastEaseInToSlowEaseOut),
                  items: controller.banners
                      .map((banner) => EBannerImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        onPress: () => Get.toNamed(banner.targetScreen),
                      )).toList()),

              const SizedBox(height: ESizes.defaultBetweenItem),
              Obx(
                    () =>
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < controller.banners.length; i++)
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            height: 7,
                            width: 25,
                            decoration: BoxDecoration(
                              color: controller.carousalCurrentIndex.value == i
                                  ? EColors.accent
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                      ],
                    ),
              )
            ],
          );
        }
      }
    );
  }
}
