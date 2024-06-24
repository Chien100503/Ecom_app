import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class EProfileMenu extends StatelessWidget {
  const EProfileMenu(
      {super.key,
      required this.title,
      required this.subName,
      this.icon = Icons.arrow_forward_ios_rounded,
      required this.onPressed});

  final String title, subName;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0, vertical: ESizes.defaultBetweenItem / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(title),
            ),
            Expanded(
                flex: 5,
                child:
                    Text(subName, style: Theme.of(context).textTheme.titleLarge)),
            Expanded(
              child: Icon(icon,
                    color: dark ? EColors.thirdColor : EColors.primaryColor),
              ),
          ],
        ),
      ),
    );
  }
}
