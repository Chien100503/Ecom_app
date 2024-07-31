import 'package:ecom_app/common/widgets/images/round_images.dart';
import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shop/controllers/product/checkout_controller.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ESectionHeading(
          title: 'Payment method',
          titleButton: 'Change',
          onPressed: () => controller.selectPaymentMethod(context),
        ),
        const SizedBox(height: ESizes.defaultBetweenItem),
        Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ERoundImages(
                applyImageRadius: false,
                boxFit: BoxFit.contain,
                height: 40,
                width: 40,
                imageUrl: controller.selectedPaymentMethod.value.image,
                bg: Colors.transparent,
              ),
              const SizedBox(width: 10),
              Text(
                controller.selectedPaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
