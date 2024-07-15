import 'package:ecom_app/common/widgets/custom_shape/containers/round_container.dart';
import 'package:ecom_app/common/widgets/products/products_card/product_price.dart';
import 'package:ecom_app/common/widgets/texts/product_title_text.dart';
import 'package:ecom_app/common/widgets/texts/section_heading.dart';
import 'package:ecom_app/features/shop/controllers/variation_controller.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/chips/chip_color.dart';

class EProductAttributes extends StatelessWidget {
  const EProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());

    return Obx(
          () => Column(
        children: [
          if (controller.selectVariation.value.id.isNotEmpty)
            ERoundContainer(
              padding: EdgeInsets.all(ESizes.md),
              bg: dark ? EColors.primaryColor : EColors.thirdColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ESectionHeading(
                          title: 'Variation', showActionButton: false),
                      const SizedBox(width: ESizes.defaultBetweenItem),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              EProductTitleText(title: 'Price:', smallSize: true),
                              SizedBox(width: ESizes.defaultBetweenItem),
                              if (controller.selectVariation.value.price > 0)
                                Text(
                                  '\$${controller.selectVariation.value.price}%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .apply(
                                      decoration:
                                      TextDecoration.lineThrough, color: Colors.red),
                                ),
                              SizedBox(width: ESizes.defaultBetweenItem),
                              EProductPrice(price: controller.getVariationPrice()),
                            ],
                          ),
                          Row(
                            children: [
                              EProductTitleText(
                                  title: 'Status:', smallSize: true),
                              SizedBox(width: ESizes.defaultBetweenItem),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.bodyLarge,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: ESizes.defaultBetweenItem),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildDescriptionParts(controller.selectVariation.value.description ?? ''),
                  ),
                ],
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!.map((attribute) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ESectionHeading(
                    title: attribute.name ?? '',
                    showActionButton: false,
                  ),
                  Obx(
                        () => Wrap(
                      spacing: 8,
                      children: attribute.values!.map((attributeValue) {
                        final isSelected =
                            controller.selectedAttributes[attribute.name] ==
                                attributeValue;
                        final available = controller
                            .getAttributeAvailabilityInVariation(
                            product.productVariations!, attribute.name!)
                            .contains(attributeValue);

                        return EChipColor(
                          text: attributeValue,
                          selected: isSelected,
                          onSelected: available
                              ? (select) {
                            if (select && available) {
                              controller.onAttributesSelected(product,
                                  attribute.name ?? '', attributeValue);
                            }
                          }
                              : null,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDescriptionParts(String description) {
    List<String> descriptionParts = description.split(',');

    return descriptionParts.map((part) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• '),
          Expanded(
            child: EProductTitleText(
              title: '${_capitalize(part.trim())}.', // Viết hoa chữ cái đầu và loại bỏ khoảng trắng thừa
              smallSize: true,
            ),
          ),
        ],
      );
    }).toList();
  }
  List<Widget> _buildDescriptionTitle(String description) {
    List<String> descriptionParts = description.split(' - ');

    return descriptionParts.map((part) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• '),
          Expanded(
            child: EProductTitleText(
              title: '${_capitalize(part.trim())}.', // Viết hoa chữ cái đầu và loại bỏ khoảng trắng thừa
              smallSize: true,
            ),
          ),
        ],
      );
    }).toList();
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
