import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts_strings.dart';

class EloginForm extends StatelessWidget {
  const EloginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: ESizes.defaultBetweenSections),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: ETexts.email,
              ),
            ),
            const SizedBox(
              height: ESizes.inputBetweenFields,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: ETexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: ESizes.inputBetweenFields / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(ETexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(ETexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(
              height: ESizes.defaultBetweenSections,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text(ETexts.signIn))),
            const SizedBox(
              height: ESizes.defaultBetweenItem,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(ETexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}