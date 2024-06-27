import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../images/round_images.dart';
import '../../texts/product_title_text.dart';

class ECartItem extends StatelessWidget {
  const ECartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ERoundImages(
          height: 60,
          width: 60,
          imageUrl: EImages.product4,
          bg: Color(0xffF3F3F3),
          boxShadow: BoxShadow(
            offset: Offset(0, 4),
            color: Colors.grey,
            blurRadius: 5,
          ),

        ),
        const SizedBox(width: ESizes.defaultBetweenItem),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Nike',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const Icon(
                    Iconsax.verify5,
                    color: Colors.blue,
                    size: 15,
                  )
                ],
              ),
              const Flexible(
                  child: EProductTitleText(
                title: 'Black Sort shoes',
                maxLine: 2,
              )),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color: ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Green ',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size: ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: '34', style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
