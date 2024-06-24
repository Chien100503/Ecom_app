import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/chip_color.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class EOptionSize extends StatelessWidget {
  const EOptionSize({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: ESizes.defaultSpace,
        right: ESizes.defaultSpace,
        bottom: ESizes.defaultSpace,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ESectionHeading(
            title: 'Size',
            showActionButton: false,
          ),
          Wrap(
            spacing: 10,
            children: [
              EChipColor(text: 'S', selected: false, onSelected: (value){},),
              EChipColor(text: 'M', selected: false, onSelected: (value){}),
              EChipColor(text: 'L', selected: true, onSelected: (value){}),
              EChipColor(text: 'XL', selected: false, onSelected: (value){}),
              EChipColor(text: 'XXL', selected: false, onSelected: (value){}),
            ],
          ),
        ],
      ),
    );
  }
}