import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ECouponCode extends StatelessWidget {
  const ECouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            decoration: InputDecoration(
                hintText: 'Have a promo code? Enter here',
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              foregroundColor: dark ? EColors.dark : EColors.light,
              backgroundColor: Colors.grey),
          child: const Text('Apply'),
        )
      ],
    );
  }
}