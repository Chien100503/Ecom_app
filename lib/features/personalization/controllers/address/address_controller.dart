import 'package:ecom_app/common/widgets/loader/loader.dart';
import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/data/repositories/address/repository_address.dart';
import 'package:ecom_app/features/personalization/models/address_model.dart';
import 'package:ecom_app/features/personalization/screens/addresses/add_address.dart';
import 'package:ecom_app/features/personalization/screens/addresses/widget/single_address.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/cloud_helper_functions.dart';
import 'package:ecom_app/utils/helpers/network_manager.dart';
import 'package:ecom_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // To allow the bottom sheet to expand to its full height
      builder: (_) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(ESizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const ESectionHeading(title: 'Select Address'),
                FutureBuilder(
                  future: getAllUserAddress(),
                  builder: (_, snapshot) {
                    final response = CloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                    );
                    if (response != null) return response;

                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.5,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => SingleAddress(
                          address: snapshot.data![index],
                          onTap: () async {
                            await selectAddress(snapshot.data![index]);
                            Get.back();
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: ESizes.defaultSpace * 2),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const AddNewAddress()),
                    child: const Text('Add new address'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
