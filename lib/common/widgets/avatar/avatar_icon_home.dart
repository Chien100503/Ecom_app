import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_strings.dart';

class AvatarIcon extends StatelessWidget {
  const AvatarIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: EColors.primaryColor,
      child: Image(
        image: AssetImage(EImages.avt),
      ),
    );
  }
}