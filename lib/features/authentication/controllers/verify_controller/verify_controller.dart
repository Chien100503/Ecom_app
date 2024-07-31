import 'dart:async';

import 'package:ecom_app/common/widgets/loader/loader.dart';
import 'package:ecom_app/common/widgets/success_screen/success_screen.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/texts_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/repositories_authentication.dart';

class VerifyController extends GetxController {
  static VerifyController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerify();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerify() async {
    try {
      print("Sending email verification...");
      await RepositoriesAuthentication.instance.sendEmailVerify();
      ECustomSnackBar.showSuccess(
        title: 'Email sent',
        message: 'Please check your inbox and verify your email',
      );
      await RepositoriesAuthentication.instance.screenRedirect();
    } catch (e) {
      print('======================');
      print('Error occurred during email verification: $e');
      print('======================');
      if (e is FirebaseException) {
        ECustomSnackBar.showError(
          title: 'Firebase Error',
          message: e.message ?? 'Unknown error occurred',
        );
      } else {
        ECustomSnackBar.showError(
          title: 'Oh Snap',
          message: e.toString(),
        );
      }
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: EImages.success,
              title: ETexts.yourAccountCreateTitle,
              subTitle: ETexts.yourAccountCreateSubTitle,
              onPressed: () =>
                  RepositoriesAuthentication.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  checkEmailVerifyStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: EImages.success,
          title: ETexts.yourAccountCreateTitle,
          subTitle: ETexts.yourAccountCreateSubTitle,
          onPressed: () => RepositoriesAuthentication.instance.screenRedirect(),
        ),
      );
    }
  }
}
