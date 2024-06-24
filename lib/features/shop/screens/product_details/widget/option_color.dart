import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/chip_color.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class EOptionColor extends StatelessWidget {
  const EOptionColor({
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
            title: 'Color',
            showActionButton: false,
          ),
          Wrap(
            children: [
              EChipColor(text: 'green', selected: true, onSelected: (value){}),
              EChipColor(text: 'black', selected: false, onSelected: (value){}),
              EChipColor(text: 'red', selected: false, onSelected: (value){}),
              EChipColor(text: 'white', selected: false, onSelected: (value){}),
            ],
          ),
        ],
      ),
    );
  }
}