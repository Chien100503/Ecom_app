import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/loggin/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //Update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //Jump to the specific dot  selected page
  void dotNavigationCLick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // Jump current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();

      if(kDebugMode) {
        print('============= Next button======');
        print(storage.read('isFirstTime'));
      }

      storage.write('isFirstTime', false);

      Get.offAll(const LoginScreen());
    } else {
      currentPageIndex.value++;
      pageController.animateToPage(
        currentPageIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.animateToPage(2, duration: const Duration(seconds: 1),
        curve: Curves.fastEaseInToSlowEaseOut);
  }
}
