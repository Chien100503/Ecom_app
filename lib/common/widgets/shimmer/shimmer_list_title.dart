import 'package:ecom_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ShimmerListTitle extends StatelessWidget {
  const ShimmerListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            EShimmerEffect(width: 50, height: 50, radius: 15),
            SizedBox(width: ESizes.defaultSpace / 2),
            Column(
              children: [
                EShimmerEffect(width: 100, height: 15, radius: 15),
                SizedBox(height: ESizes.defaultSpace / 2),
                EShimmerEffect(width: 80, height: 12, radius: 15),
              ],
            )
          ],
        ),

      ],
    );
  }
}
