import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../personalization/controllers/update_gender_controller.dart';

class GenderSelectionScreen extends StatelessWidget {
  const GenderSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateGenderController());

    return Scaffold(
      appBar: const EAppBar(
        title: Text('Select Gender'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Please select your gender',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: ESizes.defaultBetweenSections),
            Obx(() => ListTile(
              title: const Row(
                children: [
                  Icon(Icons.man, color: Colors.red,),
                  Text('Male'),
                ],
              ),
              leading: Radio<String>(
                value: 'Male',
                groupValue: controller.selectedGender.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.setGender(value);
                  }
                },
              ),
            )),
            Obx(() => ListTile(
              title: const Row(
                children: [
                  Icon(Icons.woman, color: Colors.red,),
                  Text('Female'),
                ],
              ),
              leading: Radio<String>(
                value: 'Female',
                groupValue: controller.selectedGender.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.setGender(value);
                  }
                },
              ),
            )),
            Obx(() => ListTile(
              title: const Row(
                children: [
                  Icon(Icons.flag, color: Colors.green),
                  Text('Other'),
                ],
              ),
              leading: Radio<String>(
                overlayColor: const WidgetStatePropertyAll(Colors.red),
                value: 'Other',
                groupValue: controller.selectedGender.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.setGender(value);
                  }
                },
              ),
            )),
            const SizedBox(height: ESizes.defaultBetweenSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.saveGender(),
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
