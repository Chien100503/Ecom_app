import 'dart:convert';
import 'package:ecom_app/data/repositories/authentication/repositories_authentication.dart';
import 'package:ecom_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecom_app/features/shop/controllers/product/order_controller.dart';
import 'package:ecom_app/features/shop/controllers/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../personalization/controllers/address/address_controller.dart';
import '../../../personalization/controllers/user_controller.dart';

class StripeController extends GetxController {
  static StripeController get instance => Get.find();

  final orderController = OrderController.instance;
  final userController = UserController.instance;
  final cartController = CartController.instance;
  final productController = ProductController.instance;
  final addressController = AddressController.instance;


  Map<String, dynamic> createNameProductJson() {
    final productDetails = cartController.cartProductDetails;
    final nameProductJson = {
      'name_product': productDetails.keys.toList(),
    };
    return nameProductJson;
  }

  Map<String, dynamic> createPriceJson() {
    final productDetails = cartController.cartProductDetails;
    final priceJson = {
      'price': productDetails.values.toList(),
    };
    return priceJson;
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      print('Creating Payment Intent...');
      int amountInCents = int.parse(amount);

      Map<String, dynamic> body = {
        'amount': amountInCents.toString(),
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
          'Bearer sk_test_51PgdLoGXQ1iVSXMTpO8MySdC02fcx1Ts3GJh9xFUhGTBEVCLeaCK6kKqtTTpnnEwlUrnx3XlaH1zmKJlFU6enZDk00GL9ASQrg',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );

      var result = json.decode(response.body);
      print('Payment Intent Created: ${result.toString()}');
      return result;
    } catch (err) {
      throw Exception('Error creating payment intent: ${err.toString()}');
    }
  }

  stripeMakePayment(double totalAmount) async {
    try {
      print('Initiating Stripe Payment...');

      var paymentIntent = await createPaymentIntent(
          (totalAmount * 100).toStringAsFixed(0), 'USD');

      if (paymentIntent == null) {
        throw Exception('Failed to create payment intent.');
      }

      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              billingDetails: const BillingDetails(
                  name: 'YOUR NAME',
                  email: 'YOUREMAIL@gmail.com',
                  phone: 'YOUR NUMBER',
                  address: Address(
                      city: 'YOUR CITY',
                      country: 'YOUR COUNTRY',
                      line1: 'YOUR ADDRESS 1',
                      line2: 'YOUR ADDRESS 2',
                      postalCode: 'YOUR PINCODE',
                      state: 'YOUR STATE')),
              paymentIntentClientSecret: paymentIntent['client_secret'],
              style: ThemeMode.dark,
              merchantDisplayName: 'Ikay'))
          .then((value) {
        print('Payment Sheet Initialized');
      });

      await displayPaymentSheet(totalAmount);
    } catch (e) {
      debugPrint('Stripe Payment Error: ${e.toString()}');
    }
  }

  displayPaymentSheet(double totalAmount) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      print('Payment Sheet Presented');


      final userId = RepositoriesAuthentication.instance.authUser?.uid;
      final orders = await orderController.fetchUserOrder();
      final orderDetails = orders.firstWhere((o) => o.userId == userId);

      final address = orderDetails.address;
      final customerAddress = [
        address?.street,
        address?.ward,
        address?.city,
        address?.country,
      ];

      await http.post(
        Uri.parse('http://192.168.52.191:3000/send-invoice'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'to': userController.user.value.email,
          'invoice_id': orderDetails.id,
          'customer_name': orderDetails.address?.name,
          'customer_email': userController.user.value.email,
          'customer_phone': orderDetails.address?.phoneNumber,
          'amount_paid': totalAmount,
          'currency': 'USD',
          'customer_address': customerAddress,
          'payment_status': 'Paid', // Assuming payment status
          'description': 'Order Payment', // Description or additional information
          'items': cartController.cartItems.map((item) => {
            'product_name': item.title, // Assuming item.product.name is available
            'price': item.price, // Assuming item.product.price is available
            'quantity': item.quantity,
            'total': item.price * item.quantity
          }).toList(),
        }),
      );

      orderController.processOrder(totalAmount);
    } catch (e) {
      debugPrint('Payment Sheet Presentation Error: ${e.toString()}');
    }
  }
}
