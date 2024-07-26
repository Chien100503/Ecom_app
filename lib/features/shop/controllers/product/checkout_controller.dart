import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/features/checkout/payment/widget/payment_title.dart';
import 'package:ecom_app/features/shop/models/payment_method_model.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: 'creditCard', image: EImages.creditCard);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(context: context, builder: (_) => SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(ESizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ESectionHeading(title: 'Select Payment Method', showActionButton: false,),
            const SizedBox(height: ESizes.defaultBetweenSections),
            EPaymentTitle(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: EImages.creditCard)),
            const SizedBox(height: ESizes.defaultBetweenItem / 2),
            EPaymentTitle(paymentMethod: PaymentMethodModel(name: 'MOMO', image: EImages.momo)),
            const SizedBox(height: ESizes.defaultBetweenItem / 2),
            EPaymentTitle(paymentMethod: PaymentMethodModel(name: 'Pay on Pickup', image: EImages.payOnPickup)),
            const SizedBox(height: ESizes.defaultBetweenItem / 2),
            const SizedBox(height: ESizes.defaultBetweenSections),
            ],
        ),
      ),
    ));
  }
}