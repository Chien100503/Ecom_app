import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/features/personalization/controllers/address/address_controller.dart';
import 'package:ecom_app/features/personalization/screens/addresses/add_address.dart';
import 'package:ecom_app/features/personalization/screens/addresses/widget/single_address.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/cloud_helper_functions.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    final controller = Get.put(AddressController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: dark ? EColors.thirdColor : EColors.accent,
          onPressed: () => Get.to(
                () => const AddNewAddress(),
                transition: Transition.zoom,
                duration: const Duration(milliseconds: 500),
              ),
          child: Icon(Icons.add,
              color: dark ? EColors.accent : EColors.thirdColor)),
      appBar: EAppBar(
        showBackArrow: true,
        title:
            Text('Address', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Obx(
            ()=>  FutureBuilder(
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddress(),
              builder: (context, snapshot) {
                final response = CloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot);
                if (response != null) return response;
                final addresses = snapshot.data!;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (_, index) => SingleAddress(
                    address: addresses[index],
                    onTap: () => controller.selectAddress(addresses[index]),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
