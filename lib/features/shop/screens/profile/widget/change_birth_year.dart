import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../personalization/controllers/update_birth_controller.dart';

class BirthYearSelectionScreen extends StatefulWidget {
  const BirthYearSelectionScreen({super.key});

  @override
  _BirthYearSelectionScreenState createState() => _BirthYearSelectionScreenState();
}

class _BirthYearSelectionScreenState extends State<BirthYearSelectionScreen> {
  final TextEditingController birthYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final updateBirthdayController = Get.put(UpdateBirthdayController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Birth Year'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: birthYearController,
              decoration: const InputDecoration(labelText: 'Birth Year'),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  helpText: 'Select Birth Year',
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Theme.of(context).primaryColor,
                          onPrimary: Colors.white,
                          surface: Theme.of(context).primaryColor,
                          onSurface: Colors.black,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (pickedDate != null) {
                  setState(() {
                    birthYearController.text = pickedDate.year.toString();
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (birthYearController.text.isNotEmpty) {
                  String birthYear = birthYearController.text;
                  updateBirthdayController.updateBirthYear(birthYear);
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
