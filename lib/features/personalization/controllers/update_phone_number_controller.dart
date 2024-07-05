import 'package:ecom_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loader/loader.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../shop/screens/profile/profile.dart';

class UpdatePhoneNumberController extends GetxController {
  static UpdatePhoneNumberController get instance => Get.find();

  final phoneNumber = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updatePhoneNumberController = GlobalKey<FormState>();

  @override
  void onInit() {
    initializedPhoneNumber();
    super.onInit();
  }

  Future<void> initializedPhoneNumber() async {
    phoneNumber.text = userController.user.value.phoneNumber;
  }

  Future<void> updatePhoneNumber() async{
    try {
      EFullScreenLoader.openLoadingDialog('We are updating your information', EImages.loaderAnimation);

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

      if (!updatePhoneNumberController.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> phone = {'phone': phoneNumber.text.trim()};
      await userRepository.updateSingleField(phone);

      // Update the Rx user value
      userController.user.value.phoneNumber = phoneNumber.text.trim();

      // Remove loader
      EFullScreenLoader.stopLoading();

      ECustomSnackBar.showSuccess(title: 'Great!', message: 'Name change successful!');
      Get.off(() => const Profile());
    } catch(e) {
      EFullScreenLoader.stopLoading();

      ECustomSnackBar.showError(title: 'Oh Snap', message: e.toString());
    }
  }
}