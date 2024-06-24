import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ECircleIcon extends StatelessWidget {
  const ECircleIcon(
      {super.key,
      this.width,
      this.height,
      this.size = ESizes.lg,
      required this.icon,
      this.color,
      this.bg,
      this.onPressed, required this.border});

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? bg;
  final Border border;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: border,
        color: bg != null
            ? bg! : dark ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(100),

      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: size, color: color,),
      ),
    );
  }
}
