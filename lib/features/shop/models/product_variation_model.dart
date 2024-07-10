class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.salePrice = 0.0,
    this.price = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'SKU': sku,
      'Stock': stock,
      'AttributeValues': attributeValues
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['Id'] ?? '',
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      sku: data['SKU'] ?? '',
      stock: data['Stock'] ?? 0,
      image: data['Image'] ?? '',
      attributeValues: Map<String, String>.from(data['AttributeValues']),
    );
  }
}
