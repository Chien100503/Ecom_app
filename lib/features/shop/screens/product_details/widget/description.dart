import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:see_more/see_more.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';

class EDescription extends StatelessWidget {
  const EDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: ESizes.defaultSpace,
        right: ESizes.defaultSpace,
        bottom: ESizes.defaultSpace,
      ),
      child: Column(
        children: [
          const ESectionHeading(
            title: 'Description',
            showActionButton: false,
          ),
          const SizedBox(height: ESizes.defaultBetweenItem / 1.5),
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
              color: dark ? EColors.thirdColor : EColors.accent,
            ),
            seeLessText: "See Less",
            seeLessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: dark ? EColors.thirdColor : EColors.accent,
            ),
            trimLength: 110,
          ),
        ],
      ),
    );
  }
}