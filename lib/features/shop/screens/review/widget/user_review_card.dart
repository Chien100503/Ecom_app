import 'package:ecom_app/features/shop/screens/review/widget/rating_bar_star.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:see_more/see_more_widget.dart';

import '../../../../../utils/constants/colors.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(EImages.avt),),
                const SizedBox(width: ESizes.defaultBetweenItem,),
                Text('Username2', style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, color: dark ? EColors.thirdColor : EColors.primaryColor,)),
          ],
        ),
        Row(
          children: [
            const ERatingStar(rating: 4.2),
            const SizedBox(width: ESizes.defaultBetweenItem),
            Text('24/06/2024',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ESizes.defaultBetweenItem),
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
    );
  }
}
