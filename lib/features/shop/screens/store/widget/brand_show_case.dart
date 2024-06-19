import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shape/containers/round_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'brand_card.dart';

class EBrandShowCase extends StatelessWidget {
  const EBrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ERoundContainer(
      padding: const EdgeInsets.all(ESizes.md),
      showBorder: true,
      bg: Colors.transparent,
      margin: const EdgeInsets.only(bottom: ESizes.defaultBetweenItem),
      child: Column(
        children: [
          const EBrandCard(
            showBorder: false,
            image: EImages.diorLogo,
            height: 56,
            width: 100,
          ),
          const SizedBox(height: ESizes.defaultSpace),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: images
                    .map((image) => brandTopProductImageWidget(image, context))
                    .toList()),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
        child: ERoundContainer(
      height: 100,
      padding: const EdgeInsets.all(ESizes.md),
      margin: const EdgeInsets.only(right: ESizes.sm),
      bg: EHelperFunctions.isDarkMode(context) ? Colors.grey : EColors.cardDark,
      child: Image(
        image: AssetImage(image),
        fit: BoxFit.contain,
      ),
    ));
  }
}
