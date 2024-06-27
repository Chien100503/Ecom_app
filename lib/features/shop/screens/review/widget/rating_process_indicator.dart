import 'package:ecom_app/utils/device/device_utility.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class ERatingProcessIndicator extends StatelessWidget {
  const ERatingProcessIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Expanded(flex: 1, child: Text(text)),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: EDeviceUtils.getScreenWidth(context) * 0.5,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(10),
              value: value,
              minHeight: 10,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(dark ? EColors.thirdColor : EColors.accent),
            ),
          ),
        ),
      ],
    );
  }
}
