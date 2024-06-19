import 'package:ecom_app/features/shop/screens/home/home.dart';
import 'package:ecom_app/features/shop/screens/settings/setting.dart';
import 'package:ecom_app/features/shop/screens/store/store.dart';
import 'package:ecom_app/features/shop/screens/wishList/wishlist.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animations/animations.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = EHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: darkMode ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: NavigationBar(
            height: 70,
            elevation: 1,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: darkMode ? Colors.black : Colors.white,
            indicatorColor: darkMode
                ? EColors.light.withOpacity(0.3)
                : EColors.dark.withOpacity(0.1),
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
              NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
          ),
        ),
      ),
      body: Obx(() {
        return PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (
            Widget child,
            Animation<double> primaryAnimation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
          child: controller.screens[controller.selectedIndex.value],
        );
      }),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const Store(),
    const WishList(),
    const Setting(),
  ];
}
