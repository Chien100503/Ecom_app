import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EAnimationLoader extends StatelessWidget {
  const EAnimationLoader({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.actionButtonAnimation,
  });

  final String text, animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? actionButtonAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animation, height: 200, width: 200
          ),
          const SizedBox(height: ESizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ESizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: actionButtonAnimation,
                    style: OutlinedButton.styleFrom(
                        backgroundColor: EColors.primaryColor),
                    child: Text(actionText!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: EColors.thirdColor)),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
