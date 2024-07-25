import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../custom_shape/circle_icon.dart';

class EProductQuantityWithAddRemoveButton extends StatelessWidget {
  const EProductQuantityWithAddRemoveButton({
    super.key, this.add, this.remove, required this.quantity,
  });

  final VoidCallback? add, remove;
  final int quantity;

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
          onPressed: remove,
        ),
        const SizedBox(width: ESizes.defaultBetweenItem),
        Text(quantity.toString()),
        const SizedBox(width: ESizes.defaultBetweenItem),
        ECircleIcon(
          height: 40,
          width: 40,
          bg: Colors.black,
          color: Colors.white,
          icon: Iconsax.add,
          border: Border.all(width: 1, color: Colors.black),
          onPressed: add,
        ),
      ],
    );
  }
}