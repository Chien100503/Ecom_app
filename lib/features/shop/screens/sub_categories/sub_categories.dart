import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/common/widgets/images/round_images.dart';
import 'package:ecom_app/common/widgets/products/products_card/product_cards_horizontal.dart';
import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppBar(
        title: Text(
          'Beauty',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              const ERoundImages(
                imageUrl: EImages.banner2,
                bg: Colors.transparent,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const SizedBox(height: ESizes.defaultBetweenSections),
              Column(
                children: [
                  ESectionHeading(
                    title: 'Shop Lipstick',
                    titleButton: 'View all',
                    onPressed: () {},
                  ),
                  const SizedBox(height: ESizes.defaultBetweenItem / 2),
                  SizedBox(
                    height: 121,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: ESizes.defaultBetweenItem),
                      itemCount: 8,
                      itemBuilder: (context, index) => const EProductCardsHorizontal(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
