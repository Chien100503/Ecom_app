import 'package:ecom_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_app/common/widgets/products/products_card/product_cards_vertical.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:flutter/material.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/loader/animation_images_gif.dart';
import '../../controllers/search_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.query = '', this.product});

  final String query;
  final ProductModel? product;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ProductSearchController _searchControllerInstance =
      Get.put(ProductSearchController());

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.query.isNotEmpty
        ? widget.query.toLowerCase()
        : widget.product?.title.toLowerCase() ?? '';
    _searchControllerInstance.onSearchChanged(_searchController.text);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        showBackArrow: true,
        title: TextField(
          controller: _searchController,
          onChanged: _searchControllerInstance.onSearchChanged,
        ),
      ),
      body: Obx(() {
        if (_searchControllerInstance.searchQuery.isEmpty) {
          return const EAnimationImageGif(
              text: 'Please enter keywords to find products!',
              animation: EImages.search);
        } else if (_searchControllerInstance.filteredProducts.isEmpty) {
          return const Center(
              child: EAnimationImageGif(
                  text: 'No products found!',
                  animation: EImages.searchNoFound));
        } else {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            itemCount: _searchControllerInstance.filteredProducts.length,
            itemBuilder: (context, index) {
              final products = _searchControllerInstance.filteredProducts;
              final product = products[index];
              return EGridProductLayout(
                itemCount: products.length,
                itemBuilder: (_, index) =>
                    EProductCardVertical(product: product),
              );
            },
          );
        }
      }),
    );
  }
}
