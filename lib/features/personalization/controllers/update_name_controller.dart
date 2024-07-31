import 'package:ecom_app/data/repositories/user/user_repository.dart';
import 'package:ecom_app/features/personalization/controllers/user_controller.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loader/loader.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../shop/screens/profile/profile.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateNameController = GlobalKey<FormState>();

  @override
  void onInit() {
    initializedNames();
    super.onInit();
  }

  Future<void> initializedNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async{
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

      if (!updateNameController.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'firstName': firstName.text.trim(), 'lastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove loader
      EFullScreenLoader.stopLoading();
      ECustomSnackBar.showSuccess(title: 'Great!', message: 'Name change successful!');
      Get.off(() => const Profile());
    } catch(e) {
      print(e);
      EFullScreenLoader.stopLoading();
      ECustomSnackBar.showError(title: 'Oh Snap', message: e.toString());
    }
  }
}