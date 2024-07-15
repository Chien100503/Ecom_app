import 'package:cloud_firestore/cloud_firestore.dart';

import 'brand_model.dart';
import 'product_attribute_model.dart';
import 'product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productVariations,
    this.productAttributes,
  });

  static ProductModel empty() =>
      ProductModel(id: '',
          title: '',
          stock: 0,
          price: 0,
          thumbnail: '',
          productType: '');

  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images,
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand?.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null ? productAttributes!.map((
          e) => e.toJson()).toList() : [],
      'ProductVariations': productVariations != null ? productVariations!.map((
          e) => e.toJson()).toList() : []
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
        id: document.id,
        sku: data['SKU'],
        title: data['Title'],
        stock: data['Stock'] is int ? data['Stock'] : int.tryParse(
            data['Stock'].toString()) ?? 0,
        isFeatured: data['IsFeatured'] ?? false,
        price: data['Price'] is double ? data['Price'] : double.tryParse(
            data['Price'].toString()) ?? 0.0,
        salePrice: data['SalePrice'] is double ? data['SalePrice'] : double
            .tryParse(data['SalePrice'].toString()) ?? 0.0,
        thumbnail: data['Thumbnail'] ?? '',
        categoryId: data['CategoryId'] ?? '',
        description: data['Description'] ?? '',
        productType: data['ProductType'] ?? '',
        brand: data['Brand'] != null
            ? BrandModel.fromJson(data['Brand'])
            : null,
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        productAttributes: data['ProductAttributes'] != null
            ? (data['ProductAttributes'] as List<dynamic>).map((e) =>
            ProductAttributeModel.fromJson(e)).toList()
            : [],
        productVariations: data['ProductVariations'] != null
            ? (data['ProductVariations'] as List<dynamic>).map((e) =>
            ProductVariationModel.fromJson(e)).toList()
            : []
    );
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      thumbnail: data['Thumbnail'] ?? '',
      productType: data['ProductType'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      sku: data['SKU'] ?? '',
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [], productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList()
    );
  }

}

