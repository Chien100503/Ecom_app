import 'package:ecom_app/common/widgets/loader/loader.dart';
import 'package:ecom_app/common/widgets/success_screen/success_screen.dart';
import 'package:ecom_app/data/repositories/authentication/repositories_authentication.dart';
import 'package:ecom_app/data/repositories/order/order_repository.dart';
import 'package:ecom_app/features/personalization/controllers/address/address_controller.dart';
import 'package:ecom_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecom_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecom_app/features/shop/models/order_model.dart';
import 'package:ecom_app/navigation_menu.dart';
import 'package:ecom_app/utils/constants/enums.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  // variables
  final cartController = CartController.instance;
  final addressController = Get.put(AddressController());
  final checkoutController = CheckoutController.instance;
  final repositoryOrder = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrder() async {
    try {
      final userOrders = await repositoryOrder.fetchUserOrder();
      return userOrders;
    } catch (e) {
      ECustomSnackBar.showError(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    try {
      EFullScreenLoader.openLoadingDialog(
          'Processing your order', EImages.loaderAnimation);

      final userId = RepositoriesAuthentication.instance.authUser.uid;

      if (userId.isEmpty) return;

      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      await repositoryOrder.saveOrder(order, userId);

      cartController.clearCart();
      Get.off(() => SuccessScreen(
          image: EImages.successAnimate,
          title: 'Payment success',
          subTitle: 'Thanks you',
          onPressed: () => Get.offAll(() => const NavigationMenu())));
    } catch (e) {
      ECustomSnackBar.showError(title: 'Oh Snap!', message: e.toString());
      EFullScreenLoader.stopLoading();
    }
  }
}
