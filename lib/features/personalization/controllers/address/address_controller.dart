import 'package:ecom_app/common/widgets/loader/loader.dart';
import 'package:ecom_app/data/repositories/address/repository_address.dart';
import 'package:ecom_app/features/personalization/models/address_model.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/helpers/network_manager.dart';
import 'package:ecom_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final country = TextEditingController();
  final ward = TextEditingController();
  final city = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(RepositoryAddress());

  Future<List<AddressModel>> getAllUserAddress() async {
    try {
      final address = await addressRepository.fetchUserAddress();
      selectedAddress.value = address.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return address;
    } catch (e) {
      ECustomSnackBar.showError(
          title: 'Address not found!', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectAddress) async {
    try {
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }
      newSelectAddress.selectedAddress = true;
      selectedAddress.value = newSelectAddress;

      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);
    } catch (e) {
      ECustomSnackBar.showError(
          title: 'Error in selected', message: e.toString());
    }
  }

  // add new address
  Future addNewAddress() async {
    try {
      EFullScreenLoader.openLoadingDialog(
          'Storing address ...', EImages.loaderAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EFullScreenLoader.stopLoading();
        return;
      }
      if (!addressFormKey.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        ward: ward.text.trim(),
        country: country.text.trim(),
        city: city.text.trim(),
        state: '',
        selectedAddress: true,
      );
      final id = await addressRepository.address(address);

      address.id = id;
      selectedAddress(address);

      EFullScreenLoader.stopLoading();

      ECustomSnackBar.showSuccess(
          title: 'Great!', message: 'Your address has been saved successfully');
      refreshData.toggle();

      resetFormField();

      Navigator.of(Get.context!).pop();
    } catch (e) {
      EFullScreenLoader.stopLoading();
      ECustomSnackBar.showError(
          title: 'Address not found!', message: e.toString());
    }
  }

  void resetFormField() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    ward.clear();
    country.clear();
    street.clear();
    addressFormKey.currentState?.reset();
  }
}
