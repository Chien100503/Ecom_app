import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/common/widgets/shimmer/vertical_product_card_shimmer.dart';
import 'package:ecom_app/features/shop/controllers/product/all_product_controller.dart';
import 'package:ecom_app/features/shop/screens/all_product/widget/sortable_products.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({
    super.key,
    required this.title,
    this.query,
    this.futureMethod,
  });

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: EAppBar(
        title: Text(title, style: Theme.of(context).textTheme.titleLarge),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                const loader = EVerticalProductCardShimmer();
                final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                if (widget != null) return widget;

                final products = snapshot.data!;

                return ESortableProducts(products: products);
              }),
        ),
      ),
    );
  }
}
