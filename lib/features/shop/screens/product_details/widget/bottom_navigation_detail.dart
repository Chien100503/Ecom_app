import 'package:ecom_app/common/widgets/custom_shape/circle_icon.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EBottomNavigationDetail extends StatelessWidget {
  const EBottomNavigationDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: ESizes.defaultSpace, horizontal: ESizes.defaultSpace),
      decoration: BoxDecoration(
          color: dark ? Colors.black : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(ESizes.cardRadiusLg),
            topRight: Radius.circular(ESizes.cardRadiusLg),
          ),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 0), blurRadius: 5, color: Colors.grey)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ECircleIcon(
                border: Border.all(width: 1, color: Colors.black),
                icon: Iconsax.minus,
                bg: Colors.white,
                color: Colors.black,
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: ESizes.defaultBetweenItem,
              ),
              Text(
                '1',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                width: ESizes.defaultBetweenItem,
              ),
              ECircleIcon(
                border: Border.all(width: 1, color: Colors.white),
                icon: Iconsax.add,
                bg: Colors.black,
                color: Colors.white,
                width: 40,
                height: 40,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(ESizes.md),
                backgroundColor: EColors.thirdColor,
                side: const BorderSide(color: Colors.black),
                elevation: 5
            ),
            child: const Row(
              children: [
                Icon(Iconsax.bag, color: EColors.primaryColor,),
                SizedBox(width: ESizes.defaultBetweenItem,),
                Text('Add to bag', style: TextStyle(color: EColors.primaryColor),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
