import 'package:ecom_app/common/widgets/images/round_images.dart';
import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ESectionHeading(
          title: 'Payment method',
          titleButton: 'Change',
          onPressed: (){},
        ),
        const SizedBox(height: ESizes.defaultBetweenItem),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ERoundImages(imageUrl: EImages.paypal, bg: Colors.transparent),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        
      ],
    );
  }
}
