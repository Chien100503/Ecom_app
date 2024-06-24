import 'package:ecom_app/common/widgets/custom_shape/circle_container.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EChipColor extends StatelessWidget {
  const EChipColor({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = EHelperFunctions.getColor(text) != null;
    final dark = EHelperFunctions.isDarkMode(context);
    final chipColor = isColor ? EHelperFunctions.getColor(text)! : null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        selectedColor: chipColor,
        labelStyle: TextStyle(color: selected ? Colors.white : null),
        shape: isColor ? const CircleBorder() : null,
        avatar: isColor
            ? ECircleContainer(
                width: 50,
                height: 50,
                backgroundColor: EHelperFunctions.getColor(text)!)
            : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: isColor ? EHelperFunctions.getColor(text)! : dark ? EColors.accent : EColors.thirdColor,
      ),
    );
  }
}
