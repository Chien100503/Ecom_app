import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class ESectionHeading extends StatelessWidget {
  const ESectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.titleButton = "View all",
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, titleButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(titleButton))
      ],
    );
  }
}
