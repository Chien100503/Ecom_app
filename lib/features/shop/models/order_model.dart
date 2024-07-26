import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/features/personalization/models/address_model.dart';
import 'package:ecom_app/utils/constants/enums.dart';
import 'package:ecom_app/utils/helpers/helper_functions.dart';

import 'cart_item_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.items,
    required this.id,
    this.userId = '',
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'CreditCard',
    this.address,
    this.deliveryDate,
  });

  String get formattedOrderDate => EHelperFunctions.getFormattedDate(orderDate);

  String get formattedOrderDeliveryDate => deliveryDate != null ? EHelperFunctions.getFormattedDate(deliveryDate!) : '';

  String get orderStatusText => status == OrderStatus.delivered ?
      'Delivery' : status == OrderStatus.shipped ? 'Shipment on the way' : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.toString(),
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'address': address?.toJson(),
      'deliveryDate': deliveryDate,
      'items':items.map((item) => item.toJson()).toList()
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return OrderModel(
      id: data['id'] as String,
      userId: data['userId'] as String,
      address: AddressModel.fromMap(data['address'] as Map<String, dynamic>),
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      paymentMethod: data['paymentMethod'] as String,
      status: OrderStatus.values.firstWhere((e) => e.toString() == data['status']),
      totalAmount: data['totalAmount'] as double,
      deliveryDate: data['deliveryDate'] == null ? null : (data['deliveryDate'] as Timestamp).toDate(),
      items: (data['items'] as List<dynamic>).map((itemData) => CartItemModel.fromJson(itemData as Map<String, dynamic>)).toList()
    );
  }
}
