import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              // first name & last name
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey),
                    label: Text(ETexts.firstName, style: TextStyle(color: dark ? EColors.thirdColor : EColors.primaryColor),),
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: ESizes.inputBetweenFields,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey),
                    label: Text(ETexts.lastName, style: TextStyle(color: dark ? EColors.thirdColor : EColors.primaryColor),),
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: ESizes.inputBetweenFields,
          ),
          // username
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey),
              label: Text(ETexts.userName, style: TextStyle(color: dark ? EColors.thirdColor : EColors.primaryColor),),
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: ESizes.inputBetweenFields,
          ),
          // email
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey),
              label: Text(ETexts.email, style: TextStyle(color: dark ? EColors.thirdColor : EColors.primaryColor),),
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: ESizes.inputBetweenFields,
          ),

          // phone
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey),
              label: Text(ETexts.phoneNumber, style: TextStyle(color: dark ? EColors.thirdColor : EColors.primaryColor),),
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: ESizes.inputBetweenFields,
          ),

          // password
          TextFormField(
            expands: false,
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey),
                label: Text(ETexts.password, style: TextStyle(color: dark ? EColors.thirdColor : EColors.primaryColor),),
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(
            height: ESizes.defaultBetweenSections,
          ),
        ],
      ),
    );
  }
}
