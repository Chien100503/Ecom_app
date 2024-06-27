import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ESectionHeading(
          title: 'Shipping address',
          titleButton: 'Change',
          onPressed: (){},
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Iconsax.user),
            SizedBox(width: ESizes.defaultBetweenItem),
            Text('Username'),
          ],
        ),
        const SizedBox(width: ESizes.defaultBetweenItem),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Iconsax.location),
            SizedBox(width: ESizes.defaultBetweenItem),
            Expanded(
              child: Text(
                '12 Dai Lo Khoa Hoc, Ghenh Rang, Quy Nhon, Binh Dinh',
                overflow: TextOverflow.clip,
                softWrap: true,
              ),
            )
          ],
        ),
        const SizedBox(width: ESizes.defaultBetweenSections),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Iconsax.call),
            SizedBox(width: ESizes.defaultBetweenItem),
            Text('034 4124 9993'),
          ],
        ),
      ],
    );
  }
}
