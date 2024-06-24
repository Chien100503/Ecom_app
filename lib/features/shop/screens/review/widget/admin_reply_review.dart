import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:see_more/see_more_widget.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class EAdminReplyReview extends StatelessWidget {
  const EAdminReplyReview({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(ESizes.defaultSpace),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)
          ),
          color: dark ? EColors.accent : EColors.thirdColor),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('E\'s shop',
                  style: Theme.of(context).textTheme.titleLarge),
              Text('25/06/2024', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 5),
          SeeMoreWidget(
            "The polo shirt is a timeless and relaxed piece. Crafted in green cotton piqué, it is embellished with a tonal CD Icon embroidery on the front. The style has a regular fit and will pair easily with any jeans.",
            textStyle: TextStyle(
              fontSize: 16,
              color: dark ? Colors.white : Colors.black,
              fontWeight: FontWeight.w400,
            ),
            animationDuration: const Duration(milliseconds: 200),
            seeMoreText: "See More",
            seeMoreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: dark ? EColors.primaryColor : EColors.accent,
            ),
            seeLessText: "See Less",
            seeLessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: dark ? EColors.primaryColor : EColors.accent,
            ),
            trimLength: 110,
          ),
        ],
      ),
    );
  }
}
