import 'package:ecom_app/common/widgets/custom_shape/containers/round_container.dart';
import 'package:ecom_app/features/personalization/controllers/address/address_controller.dart';
import 'package:ecom_app/features/personalization/models/address_model.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    required this.address,
    required this.onTap,
    this.onEdit,
    this.onDelete,
  });

  final AddressModel address;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final Function(String)? onDelete;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = EHelperFunctions.isDarkMode(context);

    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;

      return GestureDetector(
        onLongPress: () {
          _showOptionsDialog(context);
        },
        child: ERoundContainer(
          padding: const EdgeInsets.all(ESizes.md),
          width: double.infinity,
          showBorder: true,
          bg: selectedAddress ? EColors.thirdColor.withOpacity(0.5) : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
              ? EColors.primaryColor
              : Colors.grey,
          margin: const EdgeInsets.only(bottom: ESizes.defaultBetweenItem),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 5,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                      ? EColors.thirdColor
                      : EColors.primaryColor
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(address.name, style: Theme.of(context).textTheme.headlineSmall,),
                  const SizedBox(height: ESizes.defaultBetweenItem),
                  Text(
                    '• ${address.street} - ${address.ward} - ${address.city} - ${address.country}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: ESizes.defaultBetweenItem / 2),
                  Text('• ${address.phoneNumber}', maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  void _showOptionsDialog(BuildContext context) async {
    final dark = EHelperFunctions.isDarkMode(context);

    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Options', style: TextStyle(color: dark ? EColors.thirdColor : EColors.primaryColor)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit, color: dark ? EColors.thirdColor : EColors.primaryColor),
                title: Text('Edit'),
                onTap: () {
                  Navigator.of(context).pop('edit');
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: dark ? EColors.thirdColor : EColors.primaryColor),
                title: Text('Delete'),
                onTap: () {
                  Navigator.of(context).pop('delete');
                },
              ),
            ],
          ),
          backgroundColor: dark ? EColors.primaryColor : Colors.white,
          elevation: 4.0,
        );
      },
    );

    if (result == 'edit' && onEdit != null) {
      onEdit!();
    } else if (result == 'delete' && onDelete != null) {
      onDelete!(address.id);
    }
  }
}
