import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text('Subtotal',
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            Text('\$ 300', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ESizes.defaultBetweenItem / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping free', style: Theme.of(context).textTheme.headlineSmall),
            Text('\$30', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ESizes.defaultBetweenItem / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.headlineSmall),
            Text('\$15', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ESizes.defaultBetweenSections,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order total', style: Theme.of(context).textTheme.headlineSmall),
            Text('\$345', style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
        const SizedBox(height: ESizes.defaultBetweenSections / 2),
        const Divider(),
      ],
    );
  }
}
