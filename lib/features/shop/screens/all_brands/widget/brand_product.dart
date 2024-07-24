import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/common/widgets/shimmer/vertical_product_card_shimmer.dart';
import 'package:ecom_app/features/shop/controllers/product/brand_controller.dart';
import 'package:ecom_app/features/shop/models/brand_model.dart';
import 'package:ecom_app/features/shop/screens/all_product/widget/sortable_products.dart';
import 'package:ecom_app/features/shop/screens/store/widget/brand_card.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';


class EBrandProductScreen extends StatelessWidget {
  const EBrandProductScreen({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: EAppBar(
        title: Text(brand.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              EBrandCard(
                  showBorder: true,
                  height: 80,
                  width: 80, brand: brand,),
              const SizedBox(height: ESizes.defaultBetweenSections),
              FutureBuilder(
                future: controller.getBrandProduct(brandId: brand.id),
                builder: (context, snapshot) {
                  const loader = EVerticalProductCardShimmer();
                  final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  final brandProducts = snapshot.data!;
                  return ESortableProducts(products: brandProducts);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
