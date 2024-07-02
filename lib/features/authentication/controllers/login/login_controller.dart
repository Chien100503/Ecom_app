import 'package:ecom_app/data/repositories/authentication/respositories_authentication.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/widgets/loader/loader.dart';
import '../../../../utils/helpers/network_manager.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final remember = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      EFullScreenLoader.openLoadingDialog(
          'Login you in ...', EImages.loaderAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ECustomSnackBar.showError(
          title: 'No Internet Connection',
          message: 'Please check your internet connection and try again.',
        );
        EFullScreenLoader.stopLoading();
        return;
      }

      // Validate the form
      if (!loginFormKey.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      // Save date remember
      if (remember.value) {
        localStorage.write('REMEMBER_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_PASSWORD', password.text.trim());
      }

      // Login user using email and password
      final userCredential = await RepositoriesAuthentication.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      // Remove loader
      EFullScreenLoader.stopLoading();

      // Redirect
      RepositoriesAuthentication.instance.screenRedirect();



      ECustomSnackBar.showSuccess(
        title: 'Login Successful',
        message: 'Welcome to my app',
      );


    } catch (e) {
      EFullScreenLoader.stopLoading();
      ECustomSnackBar.showError(title: 'Oh Snap', message: e.toString());

    }
  }
}
