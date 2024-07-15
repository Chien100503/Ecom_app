import 'package:ecom_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecom_app/features/shop/controllers/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/personalization/controllers/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_strings.dart';
import '../images/circle_images.dart';

class EUserProfile extends StatelessWidget {
  const EUserProfile({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : EImages.avt;
        return ECircleImage(
            height: 60,
            width: 60,
            image: image,
            isNetworkImage: networkImage.isNotEmpty
        );
      }),
      title: Obx(
        () {
          if (controller.profileLoading.value) {
            return const EShimmerEffect(width: 80, height: 15, radius: 15);
          } else {
            return Text(controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: EColors.primaryColor));
          }
        }
      ),
      subtitle: Obx(
            () => Text(controller.user.value.email,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: EColors.primaryColor)),
      ),
      trailing: IconButton(
        icon: const Icon(
          Iconsax.edit,
          color: EColors.primaryColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
