import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shape/curved_edges/curved_edge_widget.dart';
import '../../../../../common/widgets/images/round_images.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class EProductImageSlider extends StatelessWidget {
  const EProductImageSlider({
    super.key
  });



  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return ECurvedEdgeWidget(
      child: Container(
        color: dark ? Colors.white70 : Colors.blueGrey.withOpacity(0.5),
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(ESizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(EImages.productDiorGreen),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 30,
              left: ESizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 6,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: ESizes.defaultBetweenItem,
                  ),
                  itemBuilder: (_, index) => ERoundImages(
                      border:
                      Border.all(width: 1, color: Colors.white),
                      width: 80,
                      imageUrl: EImages.productDiorWhite,
                      padding: const EdgeInsets.all(ESizes.sm),
                      bg: Colors.grey.withOpacity(0.2)),
                ),
              ),
            ),
            EAppBar(
              showBackArrow: true,
              actions: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.withOpacity(0.3)),
                  child: const Center(
                    child: Icon(
                      Iconsax.heart5,
                      color: Colors.red,
                      size: 28,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}