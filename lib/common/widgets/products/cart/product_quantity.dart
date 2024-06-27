import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../custom_shape/circle_icon.dart';

class EProductQuantityWithAddRemoveButton extends StatelessWidget {
  const EProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ECircleIcon(
          height: 40,
          width: 40,
          bg: Colors.white,
          color: Colors.black,
          icon: Iconsax.minus,
          border: Border.all(width: 1, color: Colors.black),
        ),
        const SizedBox(width: ESizes.defaultBetweenItem),
        const Text('1'),
        const SizedBox(width: ESizes.defaultBetweenItem),
        ECircleIcon(
          height: 40,
          width: 40,
          bg: Colors.black,
          color: Colors.white,
          icon: Iconsax.add,
          border: Border.all(width: 1, color: Colors.black),
        ),
      ],
    );
  }
}