import 'package:flutter/services.dart'; // Add this import
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/common/widgets/images/circle_images.dart';
import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/features/personalization/controllers/user_controller.dart';
import 'package:ecom_app/features/shop/screens/profile/widget/change_birth_year.dart';
import 'package:ecom_app/features/shop/screens/profile/widget/change_gender.dart';
import 'package:ecom_app/features/shop/screens/profile/widget/change_name.dart';
import 'package:ecom_app/features/shop/screens/profile/widget/change_phone_number.dart';
import 'package:ecom_app/features/shop/screens/profile/widget/profile_menu.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/loader/loader.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final controller = UserController.instance;
  IconData _copyIcon = Iconsax.copy;

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    setState(() {
      _copyIcon = Icons.check; // Change icon to check
    });
    ECustomSnackBar.showSuccess(title: 'Nice!', message: 'USER ID has been copied to clipboard');
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _copyIcon = Iconsax.copy; // Revert icon back after delay
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: EAppBar(
        showBackArrow: true,
        title: Text('Change information', style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Stack(
                    children: [
                      Obx(() {
                        final networkImage = controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty ? networkImage : EImages.avt;
                        return ECircleImage(
                            height: 160,
                            width: 160,
                            image: image,
                            isNetworkImage: networkImage.isNotEmpty
                        );
                      }),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: dark
                                  ? EColors.thirdColor.withOpacity(0.4)
                                  : EColors.primaryColor.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(100)),
                          child: IconButton(
                            onPressed: () => controller.uploadProfilePicture(),
                            icon: Icon(
                              Iconsax.edit,
                              color: dark ? Colors.white : Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: ESizes.defaultBetweenItem),
              Divider(
                color: dark ? EColors.thirdColor : EColors.primaryColor,
                thickness: 2,
                indent: 60,
                endIndent: 60,
              ),
              const SizedBox(height: ESizes.defaultBetweenItem),
              const ESectionHeading(
                title: 'Profile information',
                showActionButton: false,
              ),
              EProfileMenu(
                subName: controller.user.value.fullName,
                title: 'Name',
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              EProfileMenu(
                subName: controller.user.value.username,
                title: 'Username',
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              Divider(
                color: dark ? EColors.thirdColor : EColors.primaryColor,
                thickness: 2,
                indent: 60,
                endIndent: 60,
              ),
              const SizedBox(height: 10),
              const ESectionHeading(
                title: 'Personal information',
                showActionButton: false,
              ),
              EProfileMenu(
                title: 'USER ID',
                icon: _copyIcon,
                subName: controller.user.value.id,
                onPressed: () => _copyToClipboard(controller.user.value.id),
              ),
              EProfileMenu(
                title: 'E-mail',
                subName: controller.user.value.email,
                onPressed: () {},
              ),
              EProfileMenu(
                title: 'Phone',
                subName: controller.user.value.phoneNumber,
                onPressed: () => Get.to(() => const ChangePhoneNumber()),
              ),
              EProfileMenu(
                title: 'Gender',
                subName: controller.user.value.gender,
                onPressed: () => Get.to(() => const GenderSelectionScreen()),
              ),
              const SizedBox(height: 10),
              Divider(
                color: dark ? EColors.thirdColor : EColors.primaryColor,
                thickness: 2,
                indent: 60,
                endIndent: 60,
              ),
              const SizedBox(height: ESizes.defaultBetweenItem,),
              Center(
                child: TextButton(
                  child: const Text('Close account', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.redAccent),),
                  onPressed: () => controller.deleteAccountWarningPopup(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
