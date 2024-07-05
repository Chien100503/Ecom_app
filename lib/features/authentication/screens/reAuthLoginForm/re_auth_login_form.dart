import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/features/personalization/controllers/user_controller.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const EAppBar(
        title: Text('Re-Authenticate User'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: EValidation.validateEmail,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Iconsax.direct_right)),
                ),
                const SizedBox(height: ESizes.inputBetweenFields),
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        EValidation.validateEmptyText('Password', value),
                    expands: false,
                    decoration: InputDecoration(
                        label: const Text('Password'),
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye))),
                  ),
                ),
                const SizedBox(height: ESizes.defaultBetweenSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text('Verify'),
                    onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
