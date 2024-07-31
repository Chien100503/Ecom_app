import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DemoPaymentStripe extends StatelessWidget {
  const DemoPaymentStripe({super.key});
  Future<void> stripeMakePayment() async {
    try {
      var paymentIntent = await createPaymentIntent('100', 'USD');
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
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  // style: Theme.App,
                  merchantDisplayName: 'Ikay'))
          .then((value) {});

      displayPaymentSheet();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      var options = await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51PgdLoGXQ1iVSXMTpO8MySdC02fcx1Ts3GJh9xFUhGTBEVCLeaCK6kKqtTTpnnEwlUrnx3XlaH1zmKJlFU6enZDk00GL9ASQrg',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: stripeMakePayment,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Payment test'),
        ),
      ),
    );
  }
}
