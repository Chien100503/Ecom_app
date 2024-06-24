import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/common/widgets/images/circle_images.dart';
import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/features/shop/screens/profile/widget/profile_menu.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                      const ECircleImage(
                        height: 160,
                        width: 160,
                        image: EImages.avt,
                      ),
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
                            onPressed: () {},
                            icon: Icon(
                              Iconsax.edit,
                              color: dark
                                  ? EColors.thirdColor
                                  : EColors.primaryColor,
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
                subName: '_username',
                title: 'Name',
                onPressed: () {},
              ),
              EProfileMenu(
                subName: 'user_name',
                title: 'Username',
                onPressed: () {},
              ),
              const SizedBox(
                height: 10
              ),
              Divider(
                color: dark ? EColors.thirdColor : EColors.primaryColor,
                thickness: 2,
                indent: 60,
                endIndent: 60,
              ),
              const SizedBox(
                  height: 10
              ),
              const ESectionHeading(
                title: 'Personal information',
                showActionButton: false,
              ),
              EProfileMenu(
                title: 'USER ID',
                icon: Iconsax.copy,
                subName: '123',
                onPressed: () {},
              ),
              EProfileMenu(
                title: 'E-mail',
                subName: 'username@gmail.com',
                onPressed: () {},
              ),
              EProfileMenu(
                title: 'Phone',
                subName: '0123456789',
                onPressed: () {},
              ),
              EProfileMenu(
                title: 'Gender',
                subName: 'Male',
                onPressed: () {},
              ),
              EProfileMenu(
                title: 'Birthday',
                subName: '10-05-2003',
                onPressed: () {},
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
                  onPressed: (){},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
