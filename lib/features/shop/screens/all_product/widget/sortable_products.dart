import 'package:ecom_app/features/shop/controllers/product/all_product_controller.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/products_card/product_cards_vertical.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ESortableProducts extends StatefulWidget {
  const ESortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  _ESortableProductsState createState() => _ESortableProductsState();
}

class _ESortableProductsState extends State<ESortableProducts> {
  AllProductController? _controller; // Use nullable type

  @override
  void initState() {
    super.initState();
    _controller = Get.put(AllProductController());
    _controller!.assignProducts(widget.products);
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      // Handle the scenario where the controller might still be initializing
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort),
              fillColor: EColors.thirdColor),
          value: _controller!.selectedSortOption.value,
          onChanged: (value) {
            _controller!.sortProducts(value!);
          },
          items: ['Name', 'High Price', 'Low Price', 'Newest', 'Sale']
              .map((option) =>
              DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: ESizes.defaultBetweenSections),
        Obx(
              () => EGridProductLayout(
            itemCount: _controller!.products.length,
            itemBuilder: (context, index) => EProductCardVertical(
                product: _controller!.products[index]),
          ),
        )
      ],
    );
  }
}
