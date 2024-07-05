import 'package:ecom_app/features/personalization/controllers/update_phone_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/validators/validation.dart';

class ChangePhoneNumber extends StatefulWidget {
  const ChangePhoneNumber({super.key});

  @override
  State<ChangePhoneNumber> createState() => _ChangePhoneNumberState();
}

class _ChangePhoneNumberState extends State<ChangePhoneNumber> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePhoneNumberController());
    return Scaffold(
      appBar: const EAppBar(
        title: Text('Change Phone number'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              Text('Please enter your phone in the boxes below',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: ESizes.defaultBetweenSections),
              Form(
                  key: controller.updatePhoneNumberController,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.phoneNumber,
                        validator: (value) => EValidation.validateEmptyText('Phone', value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: 'First name', prefixIcon: Icon(Iconsax.user)
                        ),
                      ),
                      const SizedBox(height: ESizes.defaultBetweenSections),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.updatePhoneNumber(),
                          child: const Text('Save'),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
