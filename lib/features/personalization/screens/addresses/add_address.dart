import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: EAppBar(
        title: Text(
          'Add address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user,
                        color:
                            dark ? EColors.thirdColor : EColors.primaryColor),
                    label: Text('Name',
                        style: TextStyle(
                            color: dark
                                ? EColors.thirdColor
                                : EColors.primaryColor)),
                  ),
                ),
                const SizedBox(
                  height: ESizes.inputBetweenFields,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.call,
                        color:
                            dark ? EColors.thirdColor : EColors.primaryColor),
                    label: Text('Phone number',
                        style: TextStyle(
                            color: dark
                                ? EColors.thirdColor
                                : EColors.primaryColor)),
                  ),
                ),
                const SizedBox(
                  height: ESizes.inputBetweenFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.edit_road,
                              color: dark
                                  ? EColors.thirdColor
                                  : EColors.primaryColor),
                          label: Text('Street',
                              style: TextStyle(
                                  color: dark
                                      ? EColors.thirdColor
                                      : EColors.primaryColor)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: ESizes.inputBetweenFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.maps_home_work_outlined,
                              color: dark
                                  ? EColors.thirdColor
                                  : EColors.primaryColor),
                          label: Text('Ward',
                              style: TextStyle(
                                  color: dark
                                      ? EColors.thirdColor
                                      : EColors.primaryColor)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: ESizes.inputBetweenFields,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_city_outlined,
                        color:
                            dark ? EColors.thirdColor : EColors.primaryColor),
                    label: Text('City',
                        style: TextStyle(
                            color: dark
                                ? EColors.thirdColor
                                : EColors.primaryColor)),
                  ),
                ),
                const SizedBox(
                  height: ESizes.inputBetweenFields,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.global_search,
                        color:
                            dark ? EColors.thirdColor : EColors.primaryColor),
                    label: Text('Country',
                        style: TextStyle(
                            color: dark
                                ? EColors.thirdColor
                                : EColors.primaryColor)),
                  ),
                ),
                const SizedBox(height: ESizes.defaultBetweenSections),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Save')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
