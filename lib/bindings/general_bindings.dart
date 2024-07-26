import 'package:ecom_app/features/personalization/controllers/address/address_controller.dart';
import 'package:ecom_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecom_app/features/shop/controllers/variation_controller.dart';
import 'package:ecom_app/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}