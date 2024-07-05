// import 'package:ecom_app/features/personalization/controllers/user_controller.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../../../common/widgets/loader/loader.dart';
// import '../../../data/repositories/user/user_repository.dart';
// import '../../../utils/constants/images_strings.dart';
// import '../../../utils/helpers/network_manager.dart';
// import '../../../utils/popups/full_screen_loader.dart';
// import '../../shop/screens/profile/profile.dart';
//
// class UpdateGenderController extends GetxController {
//   static UpdateGenderController get instance => Get.find();
//
//   var selectedGender = ''.obs;
//
//   final gender = ''.obs;
//   final userController = UserController.instance;
//   final userRepository = Get.put(UserRepository());
//
//   GlobalKey<FormState> updateGenderController = GlobalKey<FormState>();
//
//   @override
//   void onInit() {
//     super.onInit();
//     initializedGender();
//   }
//
//   void setGender(String gender) {
//     selectedGender.value = gender;
//   }
//   void saveGender() {
//     if (selectedGender.value.isEmpty) {
//       Get.snackbar('Error', 'Please select a gender');
//     } else {
//       UpdateGenderController.instance.gender.value = selectedGender.value;
//       UpdateGenderController.instance.updateGender();
//     }
//   }
//   void initializedGender() {
//     gender.value = userController.user.value.gender ?? '';
//   }
//
//   Future<void> updateGender() async {
//     try {
//       EFullScreenLoader.openLoadingDialog('We are updating your information', EImages.loaderAnimation);
//
//       // Check network connectivity
//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         ECustomSnackBar.showError(
//           title: 'No Internet Connection',
//           message: 'Please check your internet connection and try again.',
//         );
//         EFullScreenLoader.stopLoading();
//         return;
//       }
//
//       // Ensure the form state is not null and is valid
//       if (updateGenderController.currentState == null || !updateGenderController.currentState!.validate()) {
//         EFullScreenLoader.stopLoading();
//         return;
//       }
//
//       Map<String, dynamic> updatedData = {'gender': gender.value.trim()};
//       await userRepository.updateSingleField(updatedData);
//
//       // Update the Rx user value
//       userController.user.update((user) {
//         if (user != null) {
//           user.gender = gender.value.trim();
//         }
//       });
//
//       // Remove loader
//       EFullScreenLoader.stopLoading();
//
//       ECustomSnackBar.showSuccess(title: 'Great!', message: 'Gender update successful!');
//       Get.off(() => const Profile());
//     } catch (e) {
//       EFullScreenLoader.stopLoading();
//
//       ECustomSnackBar.showError(title: 'Oh Snap', message: e.toString());
//     }
//   }
// }