import 'package:ecom_app/navigation_menu.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(EImages.successAnimate, repeat: false, height: 200, width: 200),
            const SizedBox(height: ESizes.defaultBetweenSections,),
            Text(
              'Payment success!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // SizedBox(height: ESizes.defaultBetweenItem / 2),
            Text('Your item will be shipped soon!',
                style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: ESizes.defaultBetweenItem),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text('Continue'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
