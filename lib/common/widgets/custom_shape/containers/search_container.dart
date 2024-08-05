import 'package:ecom_app/features/shop/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ESearchContainer extends StatelessWidget {
  const ESearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: ESizes.defaultSpace),
    this.product,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: () => Get.to(
          () => SearchScreen(query: product?.title ?? '', product: product),
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(milliseconds: 400),
        ),
        child: Container(
          width: EDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(ESizes.md),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ESizes.borderRadiusLg),
              border: showBorder ? Border.all(color: EColors.accent) : null,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, offset: Offset(0, 4), blurRadius: 5)
              ]),
          child: Row(
            children: [
              const Icon(Iconsax.search_normal, color: EColors.accent),
              const SizedBox(width: ESizes.defaultBetweenItem),
              Expanded(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      text,
                      textStyle: TextStyle(
                        color: dark ? EColors.accent : EColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      speed: const Duration(milliseconds: 200),
                      cursor: '😊',
                      curve: Curves.easeInOutBack,
                    ),
                  ],
                  isRepeatingAnimation: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
