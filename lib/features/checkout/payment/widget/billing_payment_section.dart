import 'package:ecom_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/pricing_caculator.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text('Subtotal',
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            Text('\$ $subTotal', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ESizes.defaultBetweenItem / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping free', style: Theme.of(context).textTheme.headlineSmall),
            Text('\$ ${EPricingCaculator.caculateShippingCost(subTotal, 'VN')}', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ESizes.defaultBetweenItem / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.headlineSmall),
            Text('\$ ${EPricingCaculator.caculateTax(subTotal, 'VN')}', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ESizes.defaultBetweenSections,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order total', style: Theme.of(context).textTheme.headlineSmall),
            Text('\$ ${EPricingCaculator.calculateTotalPrice(subTotal, 'VN')}', style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
        const SizedBox(height: ESizes.defaultBetweenSections / 2),
        const Divider(),
      ],
    );
  }
}
