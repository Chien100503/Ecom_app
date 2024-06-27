import 'package:ecom_app/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widget/vertical_image_text.dart';
import '../../../../../utils/constants/images_strings.dart';

class EHomeCategories extends StatelessWidget {
  const EHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (_, index) {
          return VerticalImageText(
            title: 'Shoes',
            textColor: Colors.black,
            onTap: () => Get.to(() => const SubCategoryScreen(),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 400)
            ),
            image: EImages.shoesIcon,
          );
        },
      ),
    );
  }
}