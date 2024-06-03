import 'package:ecom_app/common/style/spacing_styles.dart';
import 'package:ecom_app/features/authentication/screens/loggin/widgets/login_form.dart';
import 'package:ecom_app/features/authentication/screens/loggin/widgets/login_divider.dart';
import 'package:ecom_app/features/authentication/screens/loggin/widgets/login_header.dart';
import 'package:ecom_app/features/authentication/screens/loggin/widgets/login_social_button.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/texts_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: ESpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            // logo, title & sub-title
            const ELoginHeader(),
            // Form
            const EloginForm(),
            const SizedBox(
              height: ESizes.defaultBetweenItem,
            ),
            // divider
            EFormDivider(dividerText: ETexts.orSignInWith.capitalize!,),
            const SizedBox(
              height: ESizes.defaultBetweenSections,
            ),
            //footer
            const ESocialButtons()
          ],
        ),
      ),
    );
  }
}








