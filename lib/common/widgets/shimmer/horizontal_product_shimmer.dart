import 'package:ecom_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EHorizontalProductShimmer extends StatelessWidget {
  const EHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ESizes.defaultBetweenSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: ESizes.defaultBetweenItem),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            EShimmerEffect(width: 120, height: 120, radius: 15),
            SizedBox(width: ESizes.defaultBetweenItem),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: ESizes.defaultBetweenItem / 2),
                EShimmerEffect(width: 160, height: 15, radius: 15),
                SizedBox(height: ESizes.defaultBetweenItem / 2),
                EShimmerEffect(width: 160, height: 15, radius: 15),
                SizedBox(height: ESizes.defaultBetweenItem / 2),
                EShimmerEffect(width: 160, height: 15, radius: 15),
                Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }
}
