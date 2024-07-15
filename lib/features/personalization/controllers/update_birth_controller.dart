import 'package:get/get.dart';
import '../../../common/widgets/loader/loader.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../shop/screens/profile/profile.dart';
import '../controllers/user_controller.dart';

class UpdateBirthdayController extends GetxController {
  static UpdateBirthdayController get instance => Get.find();

  Future<void> updateBirthYear(String birthYear) async {
    try {
      EFullScreenLoader.openLoadingDialog(
          'We are updating your information', EImages.loaderAnimation);

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

      final user = UserController.instance.user.value;
      final updatedUser = user.copyWith(birthYear: birthYear); // Use named parameter
      await UserController.instance.userRepository.updateUserDetails(updatedUser);
      UserController.instance.user.value = updatedUser;
      UserController.instance.user.refresh();

      ECustomSnackBar.showSuccess(
          title: 'Success', message: 'Birth year updated successfully');

      Get.off(() => const Profile());
    } catch (e) {
      Get.snackbar('Error', 'Failed to update birth year');
    }
  }
}
