import 'package:ecom_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_app/common/widgets/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerBrand extends StatelessWidget {
  const ShimmerBrand({super.key, this.count = 4});

  final int count;

  @override
  Widget build(BuildContext context) {
    return EGridProductLayout(itemCount: count, itemBuilder: (_, __) => const EShimmerEffect(width: 300, height: 80, radius: 15));
  }
}
