import 'package:ecom_app/common/widgets/loader/loader.dart';
import 'package:ecom_app/data/repositories/authentication/repositories_authentication.dart';
import 'package:ecom_app/features/personalization/models/user_model.dart';
import 'package:ecom_app/data/repositories/user/user_repository.dart';
import 'package:ecom_app/features/authentication/screens/loggin/login.dart';
import 'package:ecom_app/features/authentication/screens/reAuthLoginForm/re_auth_login_form.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/helpers/network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel
      .empty()
      .obs;

  final hidePassword = false.obs;
  final userRepository = Get.put(UserRepository());
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();

  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user Record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // Refresh user record
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert name to first and last name
          final nameParts =
          UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          // Map data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );
          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      ECustomSnackBar.showWarning(
          title: 'Data not save',
          message: 'Something went wrong while saving your information');
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      backgroundColor: EColors.accent,
      contentPadding: const EdgeInsets.all(ESizes.md),
      title: 'Delete account',
      titleStyle: const TextStyle(color: EColors.thirdColor),
      middleText: 'Are you sure to delete this account?',
      middleTextStyle: const TextStyle(color: EColors.thirdColor),
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.redAccent)),
        child: const Text('Delete'),
      ),
      cancel: ElevatedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        style:
        const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.grey)),
        child: const Text('Cancel'),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      EFullScreenLoader.openLoadingDialog(
          'Processing', EImages.loaderAnimation);

      final auth = RepositoriesAuthentication.instance;
      final provider =
          auth.authUser!
              .providerData
              .map((e) => e.providerId)
              .first;

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          EFullScreenLoader.stopLoading();
        } else if (provider == 'password') {
          EFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      EFullScreenLoader.stopLoading();
      ECustomSnackBar.showWarning(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      EFullScreenLoader.openLoadingDialog(
          'Processing...', EImages.loaderAnimation);

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

      if (!reAuthFormKey.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      await RepositoriesAuthentication.instance
          .reAuthenticateWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await RepositoriesAuthentication.instance.deleteAccount();

      EFullScreenLoader.stopLoading();

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      EFullScreenLoader.stopLoading();
      ECustomSnackBar.showWarning(title: 'Oh Snap', message: e.toString());
    }
  }

  uploadProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512);
      if (image != null) {
        final imageUrl = await userRepository.uploadImage(
            'Users/Images/Profile', image);

        // update user image record
        Map<String, dynamic> json = {'profilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        ECustomSnackBar.showSuccess(
            title: 'Good!', message: 'Your profile picture has been changed');
      }
    } catch (e) {
      ECustomSnackBar.showError(
          title: 'Oh Snap!', message: 'Something went wrong $e');
    }
  }

}
