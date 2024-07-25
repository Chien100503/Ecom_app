class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  CartItemModel({
    required this.productId,
    this.title = '',
    this.price = 0.0,
    this.image,
    required this.quantity,
    this.variationId = '',
    this.brandName,
    this.selectedVariation,
  });

  static CartItemModel empty() => CartItemModel(
    productId: '',
    quantity: 0,
  );

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'brandName': brandName,
      'selectedVariation': selectedVariation,
      'variationId': variationId
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      title: json['title'],
      productId: json['productId'],
      quantity: json['quantity'],
      price: json['price']?.toDouble(),
      image: json['image'],
      variationId: json['variationId'],
      selectedVariation: json['selectVariation'] != null ? Map<String, String>.from(json['selectVariation']) : null,
      brandName: json['brandName']
    );
  }
}
