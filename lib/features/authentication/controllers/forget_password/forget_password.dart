import 'package:ecom_app/common/widgets/loader/loader.dart';
import 'package:ecom_app/data/repositories/authentication/repositories_authentication.dart';
import 'package:ecom_app/features/authentication/screens/password/reset_password.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/helpers/network_manager.dart';
import 'package:ecom_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // Variable
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send reset password email
  sendPasswordResetEmail() async {
    try {
      // Load start
      EFullScreenLoader.openLoadingDialog(
          'Processing your request...', EImages.loaderAnimation);

      // Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EFullScreenLoader.stopLoading();
        return;
      }

      // Validate the form
      if (!forgetPasswordFormKey.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      await RepositoriesAuthentication.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove loader
      EFullScreenLoader.stopLoading();

      // Show success
      ECustomSnackBar.showSuccess(
          title: 'Email rent',
          message: 'Email link send to reset your password');

      //Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      EFullScreenLoader.stopLoading();
      ECustomSnackBar.showError(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async{
    try {
      // Load start
      EFullScreenLoader.openLoadingDialog(
          'Processing your request...', EImages.loaderAnimation);

      // Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EFullScreenLoader.stopLoading();
        return;
      }
      // Send email to reset password
      await RepositoriesAuthentication.instance.sendPasswordResetEmail(email);

      // Remove loader
      EFullScreenLoader.stopLoading();

      // Show success
      ECustomSnackBar.showSuccess(title: 'Email rent', message: 'Email link send to reset your password'.tr);

    } catch (e) {
      EFullScreenLoader.stopLoading();
      ECustomSnackBar.showError(title: 'Oh Snap', message: e.toString());
    }
  }
}
