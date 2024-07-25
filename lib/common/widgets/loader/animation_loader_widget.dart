import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EAnimationLoaderWidget extends StatelessWidget {
  const EAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
       this.showAction = false,
      this.actionText,
      this.onActionPress});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(height: ESizes.defaultSpace),
          Text(
            text, style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ESizes.defaultSpace),
          showAction ?
              SizedBox(width: 250,child:  OutlinedButton(
                onPressed: onActionPress,
                style: OutlinedButton.styleFrom(backgroundColor: EColors.dark),
                child: const Text('Cancel'),
              ),) : const Text('no')
        ],
      ),
    );
  }
}
