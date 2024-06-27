import 'package:ecom_app/common/widgets/texts/bran_title_with_verify_icon.dart';
import 'package:ecom_app/utils/constants/enums.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shape/containers/round_container.dart';
import '../../../../../common/widgets/images/circle_images.dart';
import '../../../../../utils/constants/sizes.dart';

class EBrandCard extends StatelessWidget {
  const EBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.image, required this.height, required this.width,
  });

  final double height, width;
  final String image;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: ERoundContainer(
        padding: const EdgeInsets.all(ESizes.sm),
        showBorder: showBorder,
        bg: Colors.transparent,
        child: Row(
          children: [
            ECircleImage(
              height: height,
              width: width,
              image: image,
              isNetworkImage: false,
              bg: Colors.transparent,
              overlayColor: dark ? Colors.white : Colors.black,
            ),
            const SizedBox(width: ESizes.defaultBetweenItem / 2),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EBrandTitleWithVerifyIcon(
                    title: 'Doir',
                    brandTextSize: TextSizes.medium,
                  ),
                  Text(
                    '123 product',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
