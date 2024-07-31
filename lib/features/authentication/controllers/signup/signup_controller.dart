import 'package:ecom_app/common/widgets/loader/loader.dart';
import 'package:ecom_app/data/repositories/authentication/repositories_authentication.dart';
import 'package:ecom_app/data/repositories/user/user_repository.dart';
import 'package:ecom_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/helpers/network_manager.dart';
import 'package:ecom_app/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  late Rx<User?> user;
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final username = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      // Start loading
      EFullScreenLoader.openLoadingDialog(
        'We\'re processing your information...',
        EImages.loaderAnimation,
      );

      // Check network connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ECustomSnackBar.showError(
          title: 'No Internet Connection',
          message: 'Please check your internet connection and try again.',
        );
        EFullScreenLoader.stopLoading();
        return;
      }

      if (!signupFormKey.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      if (!privacyPolicy.value) {
        EFullScreenLoader.stopLoading();
        ECustomSnackBar.showWarning(
          title: 'Accept Privacy Policy',
          message:
              'In order to create an account, you must accept the privacy policy.',
        );
        return;
      }

      // Register user in the firebase & save user data in the firebase
      final userCredential = await RepositoriesAuthentication.instance
          .registerEmailWithPassword(email.text.trim(), password.text.trim());

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
        gender: ''
      );

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      EFullScreenLoader.stopLoading();

      ECustomSnackBar.showSuccess(
          title: 'Congratulations',
          message: 'Your account has been created!, Verify email to continue');
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      EFullScreenLoader.stopLoading();
      ECustomSnackBar.showError(title: 'Oh Snap', message: e.toString());
    }
  }
}
