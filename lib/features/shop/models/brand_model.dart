import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel(
      {required this.id,
      required this.image,
      required this.name,
      this.isFeatured,
      this.productsCount});

  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  toJson() {
    return {
      'Id': id,
      'Name': name,
      'IsFeatured': isFeatured,
      'ProductsCount': productsCount
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      image: data['Image'] ?? '',
      name: data['Name'] ?? '',
      isFeatured: data['IsFeatured'] ?? '',
      productsCount: int.parse((data['ProductsCount'] ?? 0).toString()),
    );
  }

  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return BrandModel(
          id: document.id,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          isFeatured: data['IsFeatured'] ?? false,
          productsCount: int.parse((data['ProductsCount'] ?? '0').toString())
      );
    } else {
      return BrandModel.empty();
    }
  }
}
