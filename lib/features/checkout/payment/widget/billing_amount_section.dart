import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/features/personalization/controllers/address/address_controller.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressController());

    return Column(
      children: [
        ESectionHeading(
          title: 'Shipping address',
          titleButton: 'Change',
          onPressed: () => addressController.selectNewAddressPopup(context),
        ),
        Obx(
          () => addressController.selectedAddress.value.id.isNotEmpty
              ? Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Iconsax.user),
                        const SizedBox(width: ESizes.defaultBetweenItem),
                        Text(addressController.selectedAddress.value.name),
                      ],
                    ),
                    const SizedBox(width: ESizes.defaultBetweenItem * 2),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Iconsax.location),
                        const SizedBox(width: ESizes.defaultBetweenItem),
                        Expanded(
                          child: Text(
                            '${addressController.selectedAddress.value.street}, ${addressController.selectedAddress.value.ward}, ${addressController.selectedAddress.value.city}, ${addressController.selectedAddress.value.country}',
                            overflow: TextOverflow.clip,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: ESizes.defaultBetweenSections * 2),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Iconsax.call),
                        const SizedBox(width: ESizes.defaultBetweenItem),
                        Text(addressController
                            .selectedAddress.value.phoneNumber),
                      ],
                    ),
                  ],
                )
              : Text(
                  'Select address',
                  style: Theme.of(context).textTheme.bodyMedium,
                  softWrap: true,
                ),
        ),
      ],
    );
  }
}
