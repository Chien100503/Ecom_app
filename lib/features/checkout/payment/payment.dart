import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/common/widgets/custom_shape/containers/round_container.dart';
import 'package:ecom_app/common/widgets/loader/loader.dart';
import 'package:ecom_app/common/widgets/products/cart/cart_items.dart';
import 'package:ecom_app/features/checkout/payment/widget/billing_address_section.dart';
import 'package:ecom_app/features/checkout/payment/widget/billing_amount_section.dart';
import 'package:ecom_app/features/checkout/payment/widget/billing_payment_section.dart';
import 'package:ecom_app/features/checkout/payment/widget/payment_success.dart';
import 'package:ecom_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/pricing_caculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/products/cart/coupon_code.dart';
import '../../shop/controllers/product/order_controller.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final subtotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = EPricingCaculator.calculateTotalPrice(subtotal, 'VN');

    return Scaffold(
      appBar: const EAppBar(
        title: Text('Order review'),
        showBackArrow: true,
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: ElevatedButton(
            onPressed: subtotal > 0 ? () => orderController.processOrder(totalAmount) : () => ECustomSnackBar.showWarning(title: 'Empty cart', message: 'Add items in the cart to proceed'),
            child:  Text('Payment \$ $totalAmount'),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              ECartItems(
                showAddRemoveButton: false,

                isEditing: false,
                selectedItems: {},
              ),
              SizedBox(height: ESizes.defaultBetweenSections),
              ERoundContainer(
                showBorder: true,
                bg: Colors.transparent,
                padding: EdgeInsets.fromLTRB(
                    ESizes.md, ESizes.sm, ESizes.sm, ESizes.sm),
                child: ECouponCode(),
              ),
              SizedBox(height: ESizes.defaultBetweenSections),
              ERoundContainer(
                showBorder: true,
                bg: Colors.transparent,
                padding: EdgeInsets.fromLTRB(
                    ESizes.md, ESizes.md, ESizes.md, ESizes.md),
                child: Column(
                  children: [
                    BillingPaymentSection(),
                    BillingAddressSection(),
                    BillingAmountSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
