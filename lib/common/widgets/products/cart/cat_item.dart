import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/models/cart_item_model.dart';
import '../../../../utils/constants/sizes.dart';
import '../../images/round_images.dart';
import '../../texts/product_title_text.dart';

class ECartItem extends StatelessWidget {
  const ECartItem({
    super.key,
    required this.cartItem,
    required this.isEditing,
    required this.selectedItems,
  });

  final CartItemModel cartItem;
  final bool isEditing;
  final Set<CartItemModel> selectedItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isEditing)
          Checkbox(
            value: selectedItems.contains(cartItem),
            onChanged: (isSelected) {
              if (isSelected == true) {
                selectedItems.add(cartItem);
              } else {
                selectedItems.remove(cartItem);
              }
            },
          ),
        ERoundImages(
          height: 60,
          width: 60,
          imageUrl: cartItem.image ?? '',
          isNetworkImage: true,
          bg: const Color(0xffF3F3F3),
          boxFit: BoxFit.contain,
          boxShadow: const BoxShadow(
            offset: Offset(0, 4),
            color: Colors.grey,
            blurRadius: 5,
          ),
        ),
        const SizedBox(width: ESizes.defaultBetweenItem),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    cartItem.brandName ?? '',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const Icon(
                    Iconsax.verify5,
                    color: Colors.blue,
                    size: 15,
                  )
                ],
              ),
              Flexible(
                child: EProductTitleText(
                  title: cartItem.title,
                  maxLine: 2,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map(
                        (e) => TextSpan(
                      children: [
                        TextSpan(
                          text: ' ${e.key}: ',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: e.value,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

