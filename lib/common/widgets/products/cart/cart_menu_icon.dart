import 'package:ecom_app/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    this.iconColor = Colors.white,
    required this.onPressed,
    required this.icons,
  });

  final Icon icons;
  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    final controller = Get.put(CartController());

    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: icons,
          color: iconColor,
        ),
        Positioned(
          top: 5,
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: dark ? EColors.accent : EColors.primaryColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                    () => Text(
                  controller.noOfCartItems.value.toString(),
                  style: TextStyle(
                    color: dark ? Colors.white : Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

