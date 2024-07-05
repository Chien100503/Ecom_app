import 'package:ecom_app/common/widgets/loader/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EAnimationLoader(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
