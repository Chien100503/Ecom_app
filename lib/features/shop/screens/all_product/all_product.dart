import 'package:ecom_app/common/widgets/appbar/appbar.dart';
import 'package:ecom_app/features/shop/screens/all_product/widget/sortable_products.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EAppBar(
        title: Text('Popular product'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: ESortableProducts(),
        ),
      ),
    );
  }
}

