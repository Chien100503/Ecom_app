import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_strings.dart';
import '../images/circle_images.dart';

class EUserProfile extends StatelessWidget {
  const EUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const ECircleImage(
        height: 60,
        width: 60,
        padding: 0,
        image: EImages.avt,
      ),
      title: Text('Ho Xuan Chien',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: EColors.primaryColor)),
      subtitle: Text('chienhx@gmail.com',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: EColors.primaryColor)),
      trailing: IconButton(
        icon: const Icon(
          Iconsax.edit,
          color: EColors.primaryColor,
        ),
        onPressed: () {},
      ),
    );
  }
}
