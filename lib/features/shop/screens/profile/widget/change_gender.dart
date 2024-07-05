// // gender_selection_screen.dart
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../personalization/controllers/update_gender_controller.dart';
// import '../../../../personalization/controllers/user_controller.dart';
//
// class GenderSelectionScreen extends StatelessWidget {
//   static GenderSelectionScreen get instance => Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(UpdateGenderController());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Gender'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Please select your gender:',
//               style: TextStyle(fontSize: 18),
//             ),
//             Obx(() => ListTile(
//               title: Text('Male'),
//               leading: Radio<String>(
//                 value: 'Male',
//                 groupValue: controller.selectedGender.value,
//                 onChanged: (value) {
//                   if (value != null) {
//                     controller.setGender(value);
//                   }
//                 },
//               ),
//             )),
//             Obx(() => ListTile(
//               title: Text('Female'),
//               leading: Radio<String>(
//                 value: 'Female',
//                 groupValue: controller.selectedGender.value,
//                 onChanged: (value) {
//                   if (value != null) {
//                     controller.setGender(value);
//                   }
//                 },
//               ),
//             )),
//             Obx(() => ListTile(
//               title: Text('Other'),
//               leading: Radio<String>(
//                 value: 'Other',
//                 groupValue: controller.selectedGender.value,
//                 onChanged: (value) {
//                   if (value != null) {
//                     controller.setGender(value);
//                   }
//                 },
//               ),
//             )),
//             SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () => controller.saveGender(),
//                 child: Text('Save'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
