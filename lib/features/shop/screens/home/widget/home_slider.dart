import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_app/features/shop/controllers/home_controller.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/images/banner_image.dart';

class ESlider extends StatelessWidget {
  const ESlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

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
            items: banners.map((url) => EBannerImage(imageUrl: url)).toList()),
        const SizedBox(height: ESizes.defaultBetweenItem),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 7,
                  width: 25,
                  decoration: BoxDecoration(
                      color: controller.carousalCurrentIndex.value == i
                          ? EColors.primaryColor
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(100)),
                )
            ],
          ),
        )
      ],
    );
  }
}
