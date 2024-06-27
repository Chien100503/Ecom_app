import 'package:ecom_app/common/widgets/avatar/avatar_icon_home.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../checkout/cart/cart.dart';

class EHomeAppBar extends StatelessWidget {
  const EHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EAppBar(
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Image(image: AssetImage(EImages.logo)),
          ),
        ],
      ),
      actions: [
        // Avt
        const AvatarIcon(),

        CartCounterIcon(
          icons: const Icon(Iconsax.shopping_bag),
          onPressed: () => Get.to(
            () => const CartScreen(),
            transition: Transition.upToDown,
            duration: const Duration(milliseconds: 400),
          ),
          iconColor: EColors.primaryColor,
        ),
      ],
    );
  }
}
