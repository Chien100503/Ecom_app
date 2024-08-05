import 'package:ecom_app/common/widgets/custom_shape/containers/round_container.dart';
import 'package:ecom_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecom_app/features/shop/models/payment_method_model.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EPaymentTitle extends StatelessWidget {
  const EPaymentTitle({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: (){
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading:ERoundContainer(
        height: 40,
        width: 60,
        padding: const EdgeInsets.all(ESizes.sm),
        child: Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain,),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
