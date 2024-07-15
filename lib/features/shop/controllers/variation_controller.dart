import 'package:ecom_app/features/shop/controllers/product/images_controller.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:ecom_app/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap<String, String> selectedAttributes = <String, String>{}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectVariation = ProductVariationModel.empty().obs;

  // select attributes, and variation
  void onAttributesSelected(
      ProductModel product, String attributeName, String attributeValue) {
    // when attribute is selected
    final selectedAttributes =
        Map<String, String>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValue(
            variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImages.value =
          selectedVariation.image;
    }

    selectVariation.value = selectedVariation; // Correct assignment here

    getProductVariationStockStatus();
  }

  bool _isSameAttributeValue(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  // Check attribute availability and variation
  Set<String?> getAttributeAvailabilityInVariation(
      List<ProductVariationModel> variation, String attributeName) {
    final availableVariationAttributeValues = variation
        .where((variation) =>
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributeValues;
  }

  String getVariationPrice() {
    return (selectVariation.value.salePrice > 0
            ? selectVariation.value.salePrice
            : selectVariation.value.price)
        .toString();
  }

  // check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectVariation.value.stock > 0 ? 'In stock' : 'Out of stock';
  }

  // reset selected attribute when switching product
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectVariation.value = ProductVariationModel.empty();
  }
}
