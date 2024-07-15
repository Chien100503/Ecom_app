import 'package:ecom_app/features/personalization/controllers/user_controller.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../common/widgets/loader/loader.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../shop/screens/profile/profile.dart';

class UpdateGenderController extends GetxController {
  static UpdateGenderController get instance => Get.find();

  final selectedGender = ''.obs;
  final userRepository = Get.put(UserRepository());
  final userController = UserController.instance;

  @override
  void onInit() {
    super.onInit();
    selectedGender.value = userController.user.value.gender;
  }

  void setGender(String gender) {
    selectedGender.value = gender;
  }

  Future<void> saveGender() async {
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
      userController.user.value.gender = selectedGender.value;
      await userRepository.updateSingleField({'gender': selectedGender.value});
      userController.user.refresh();
      ECustomSnackBar.showSuccess(
          title: 'Success', message: 'Your gender has been updated');
      Get.off(() => const Profile());
    } catch (e) {
      ECustomSnackBar.showError(
          title: 'Error', message: 'Something went wrong: $e');
    }
  }
}
