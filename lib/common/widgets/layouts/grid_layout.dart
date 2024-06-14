import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../products/products_card/product_cards_vertical.dart';

class EGridProductLayout extends StatelessWidget {
  const EGridProductLayout({
    super.key,
    required this.itemCount,
    this.mainAxisEvent = 311,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisEvent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: ESizes.gridViewSpace,
        crossAxisSpacing: ESizes.gridViewSpace,
        mainAxisExtent: mainAxisEvent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
