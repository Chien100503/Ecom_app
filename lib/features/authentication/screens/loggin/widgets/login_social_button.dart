import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/login/login_controller.dart';

class ESocialButtons extends StatelessWidget {
  const ESocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: dark ? EColors.thirdColor : EColors.primaryColor),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              fit: BoxFit.cover,
              width: ESizes.iconMd,
              height: ESizes.iconMd,
              image: AssetImage(EImages.googleLogo),
            ),
          ),
        ),
        const SizedBox(width: ESizes.defaultBetweenItem),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: dark ? EColors.thirdColor : EColors.primaryColor),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              fit: BoxFit.cover,
              width: ESizes.iconMd,
              height: ESizes.iconMd,
              image: AssetImage(EImages.facebookLogo),
            ),
          ),
        ),
      ],
    );
  }
}
