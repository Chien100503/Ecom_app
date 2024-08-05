import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/features/personalization/controllers/address/address_controller.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:ecom_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/address_model.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({
    super.key,
    this.initialAddress,
    this.isEditing = false,
  });

  final AddressModel? initialAddress;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;

    // Initialize controller fields with initialAddress if editing
    if (isEditing && initialAddress != null) {
      controller.name.text = initialAddress!.name;
      controller.phoneNumber.text = initialAddress!.phoneNumber;
      controller.street.text = initialAddress!.street;
      controller.ward.text = initialAddress!.ward;
      controller.city.text = initialAddress!.city;
      controller.country.text = initialAddress!.country;
    }

    return Scaffold(
      appBar: EAppBar(
        title: Text(
          isEditing ? 'Edit Address' : 'Add Address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) => EValidation.validateEmptyText('Name', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user,
                        color:
                        dark ? EColors.thirdColor : EColors.primaryColor),
                    label: Text('Name',
                        style: TextStyle(
                            color: dark
                                ? EColors.thirdColor
                                : EColors.primaryColor)),
                  ),
                ),
                const SizedBox(
                  height: ESizes.inputBetweenFields,
                ),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: EValidation.validatePhoneNumber,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.call,
                        color:
                        dark ? EColors.thirdColor : EColors.primaryColor),
                    label: Text('Phone number',
                        style: TextStyle(
                            color: dark
                                ? EColors.thirdColor
                                : EColors.primaryColor)),
                  ),
                ),
                const SizedBox(
                  height: ESizes.inputBetweenFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) => EValidation.validateEmptyText('Street', value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.edit_road,
                              color: dark
                                  ? EColors.thirdColor
                                  : EColors.primaryColor),
                          label: Text('Street',
                              style: TextStyle(
                                  color: dark
                                      ? EColors.thirdColor
                                      : EColors.primaryColor)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: ESizes.inputBetweenFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.ward,
                        validator: (value) => EValidation.validateEmptyText('Ward', value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.maps_home_work_outlined,
                              color: dark
                                  ? EColors.thirdColor
                                  : EColors.primaryColor),
                          label: Text('Ward',
                              style: TextStyle(
                                  color: dark
                                      ? EColors.thirdColor
                                      : EColors.primaryColor)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: ESizes.inputBetweenFields,
                ),
                TextFormField(
                  controller: controller.city,
                  validator: (value) => EValidation.validateEmptyText('City', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_city_outlined,
                        color:
                        dark ? EColors.thirdColor : EColors.primaryColor),
                    label: Text('City',
                        style: TextStyle(
                            color: dark
                                ? EColors.thirdColor
                                : EColors.primaryColor)),
                  ),
                ),
                const SizedBox(
                  height: ESizes.inputBetweenFields,
                ),
                TextFormField(
                  controller: controller.country,
                  validator: (value) => EValidation.validateEmptyText('Country', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.global_search,
                        color:
                        dark ? EColors.thirdColor : EColors.primaryColor),
                    label: Text('Country',
                        style: TextStyle(
                            color: dark
                                ? EColors.thirdColor
                                : EColors.primaryColor)),
                  ),
                ),
                const SizedBox(height: ESizes.defaultBetweenSections),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => controller.addNewAddress(), child: Text(isEditing ? 'Update' : 'Save')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
