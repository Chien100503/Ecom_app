import 'package:ecom_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ShimmerBoxes extends StatelessWidget {
  const ShimmerBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: EShimmerEffect(width: 150, height: 110, radius: 15)),
            SizedBox(width: ESizes.defaultBetweenItem),
            Expanded(child: EShimmerEffect(width: 150, height: 110, radius: 15)),
            SizedBox(width: ESizes.defaultBetweenItem),
            Expanded(child: EShimmerEffect(width: 150, height: 110, radius: 15)),
          ],
        )
      ],
    );
  }
}
