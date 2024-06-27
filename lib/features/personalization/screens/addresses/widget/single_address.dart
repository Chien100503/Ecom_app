import 'package:ecom_app/common/widgets/custom_shape/containers/round_container.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return ERoundContainer(
      padding: const EdgeInsets.all(ESizes.md),
      width: double.infinity,
      showBorder: true,
      bg: selectedAddress ? EColors.thirdColor.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
          ? EColors.primaryColor
          : Colors.grey,
      margin: const EdgeInsets.only(bottom: ESizes.defaultBetweenItem),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 5,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                  ? EColors.thirdColor
                  : EColors.primaryColor
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Username', style: Theme.of(context).textTheme.headlineSmall,),
              const SizedBox(height: ESizes.defaultBetweenItem),
              Text(
                '• 12 Dai Lo Khoa Hoc, Ghenh Rang, Quy Nhon, Binh Dinh',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge,
              ),
              const SizedBox(height: ESizes.defaultBetweenItem / 2),
              Text('+84 388 228 2881', maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,)
            ],
          )
        ],
      ),
    );
  }
}
