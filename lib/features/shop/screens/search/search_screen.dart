import 'package:ecom_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_app/common/widgets/loader/animation_loader.dart';
import 'package:ecom_app/common/widgets/products/products_card/product_cards_vertical.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:flutter/material.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';

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
      appBar: AppBar(
        backgroundColor: EColors.accent,
        title: TextField(
          controller: _searchController,
          onChanged: _searchControllerInstance.onSearchChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            filled: true,
            fillColor: EColors.thirdColor,
            hintText: 'Tìm kiếm...',
            suffixIcon: const Icon(Icons.search),
          ),
        ),
      ),
      body: Obx(() {
        if (_searchControllerInstance.searchQuery.isEmpty) {
          return const EAnimationLoader(
              text: 'Vui lòng nhập từ khóa để tìm sản phẩm',
              animation: EImages.loaderAnimationOne);
        } else if (_searchControllerInstance.filteredProducts.isEmpty) {
          return const Center(child: Text('Không tìm thấy sản phẩm.'));
        } else {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            itemCount: _searchControllerInstance.filteredProducts.length,
            itemBuilder: (context, index) {
              var product = _searchControllerInstance.filteredProducts[index];
              return EGridProductLayout(
                itemCount: _searchControllerInstance.filteredProducts.length,
                itemBuilder: (_, index) => EProductCardVertical(
                  product: _searchControllerInstance.filteredProducts[index],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
