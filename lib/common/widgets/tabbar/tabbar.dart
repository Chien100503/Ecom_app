import 'package:ecom_app/utils/device/device_utility.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class ETabBar extends StatelessWidget implements PreferredSizeWidget{
  const ETabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? Colors.black : Colors.white,
      child: TabBar(
        tabAlignment: TabAlignment.center,
        overlayColor: const WidgetStatePropertyAll(EColors.thirdColor),
        isScrollable: true,
        unselectedLabelColor: Colors.blueGrey,
        indicatorColor: dark ? EColors.thirdColor : EColors.primaryColor,
        labelColor: dark ? EColors.thirdColor : EColors.primaryColor,
        tabs: tabs,
      ),
    );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(EDeviceUtils.getAppBarHeight());
}
