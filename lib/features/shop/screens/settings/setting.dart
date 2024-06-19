import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/common/widgets/custom_shape/containers/primary_header_container.dart';
import 'package:ecom_app/common/widgets/list_title/setting_menu_title.dart';
import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list_title/user_profile.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            EPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: EColors.primaryColor),
                    ),
                  ),
                  const SizedBox(height: ESizes.defaultBetweenItem),
                  const EUserProfile(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(ESizes.defaultSpace),
              child: Column(
                children: [
                  ESectionHeading(
                    title: 'Account setting',
                    onPressed: () {},
                  ),
                  ESettingMenuTitle(
                    onTap: () {},
                    title: 'Instant payment',
                    subTitle:
                        'E-Wallet, credit cards & instant debit registered',
                    icon: const Icon(Iconsax.safe_home, size: 30),
                  ),
                  const Divider(),
                  ESettingMenuTitle(
                    onTap: () {},
                    title: 'Bank account',
                    subTitle: 'Withdraw balance to registered bank account',
                    icon: const Icon(Iconsax.copy, size: 30),
                  ),
                  const Divider(),
                  ESettingMenuTitle(
                    onTap: () {},
                    title: 'Notification',
                    subTitle: 'Set any kind of notification message',
                    icon: const Icon(Iconsax.notification, size: 30),
                  ),
                  const Divider(),
                  ESettingMenuTitle(
                    onTap: () {},
                    title: 'Address list',
                    subTitle: 'Set shopping delivery address',
                    icon: const Icon(Iconsax.safe_home, size: 30),
                  ),
                  const Divider(),
                  ESettingMenuTitle(
                    onTap: () {},
                    title: 'Account security',
                    subTitle:
                        'E-Wallet, credit cards & instant debit registered',
                    icon: const Icon(Iconsax.safe_home, size: 30),
                  ),
                  const Divider(),
                  ESettingMenuTitle(
                    onTap: () {},
                    title: 'Account Privacy',
                    subTitle: 'Manage date usage and connected account',
                    icon: const Icon(Iconsax.security_card, size: 30),
                  ),
                  const SizedBox(height: ESizes.defaultBetweenSections * 2,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Logout',
                          style: TextStyle(color: EColors.thirdColor)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
