import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/shop/screens/profile/profile.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_strings.dart';

class AvatarIcon extends StatelessWidget {
  const AvatarIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => const Profile(),
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(milliseconds: 400),
      ),
      child: const CircleAvatar(
        backgroundColor: EColors.primaryColor,
        child: Image(
          image: AssetImage(EImages.avt),
        ),
      ),
    );
  }
}
