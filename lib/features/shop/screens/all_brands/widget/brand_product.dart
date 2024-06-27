import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/features/shop/screens/all_product/widget/sortable_products.dart';
import 'package:ecom_app/features/shop/screens/store/widget/brand_card.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/images_strings.dart';

class EBrandProductScreen extends StatelessWidget {
  const EBrandProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EAppBar(
        title: Text('Dior'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              EBrandCard(
                  showBorder: true,
                  image: EImages.animalIcon,
                  height: 80,
                  width: 80),
              SizedBox(height: ESizes.defaultBetweenSections),
              ESortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
