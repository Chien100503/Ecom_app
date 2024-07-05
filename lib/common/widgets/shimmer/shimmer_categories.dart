import 'package:ecom_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EShimmerCategories extends StatelessWidget {
  const EShimmerCategories({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_,__)=> const SizedBox(width: ESizes.defaultBetweenItem),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: ESizes.defaultBetweenItem /2),
              // Text
              EShimmerEffect(width: 55, height: 8, radius: 15),
            ],
          );
        },
      ),
    );
  }
}
