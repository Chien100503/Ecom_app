import 'package:ecom_app/common/widgets/custom_shape/circle_icon.dart';
import 'package:ecom_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecom_app/utils/constants/colors.dart';
import 'package:ecom_app/utils/constants/sizes.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../models/product_model.dart';

class EBottomNavigationDetail extends StatefulWidget {
  const EBottomNavigationDetail({super.key, required this.product});

  final ProductModel product;

  @override
  _EBottomNavigationDetailState createState() => _EBottomNavigationDetailState();
}

class _EBottomNavigationDetailState extends State<EBottomNavigationDetail> {
  late CartController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CartController.instance;
    _controller.updateAlreadyAddedProductCount(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: ESizes.defaultSpace, horizontal: ESizes.defaultSpace),
      decoration: BoxDecoration(
          color: dark ? Colors.black : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(ESizes.cardRadiusLg),
            topRight: Radius.circular(ESizes.cardRadiusLg),
          ),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 0), blurRadius: 5, color: Colors.grey)
          ]),
      child: Obx(
            () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
                  ()=> Row(
                children: [
                  ECircleIcon(
                    border: Border.all(width: 1, color: Colors.black),
                    icon: Iconsax.minus,
                    bg: Colors.white,
                    color: Colors.black,
                    width: 40,
                    height: 40,
                    onPressed:()=> _controller.productQuantityInCart.value < 1 ? null : _controller.productQuantityInCart -= 1,
                  ),
                  const SizedBox(
                    width: ESizes.defaultBetweenItem,
                  ),
                  Text(
                    _controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: ESizes.defaultBetweenItem,
                  ),
                  ECircleIcon(
                    border: Border.all(width: 1, color: Colors.white),
                    icon: Iconsax.add,
                    bg: Colors.black,
                    color: Colors.white,
                    width: 40,
                    height: 40,
                    onPressed: () => _controller.productQuantityInCart.value += 1,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _controller.productQuantityInCart.value < 1 ? null : () => _controller.addToCart(widget.product),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(ESizes.md),
                  backgroundColor: EColors.thirdColor,
                  side: const BorderSide(color: Colors.black),
                  elevation: 5
              ),
              child: const Row(
                children: [
                  Icon(Iconsax.bag, color: EColors.primaryColor,),
                  SizedBox(width: ESizes.defaultBetweenItem,),
                  Text('Add to bag', style: TextStyle(color: EColors.primaryColor),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
