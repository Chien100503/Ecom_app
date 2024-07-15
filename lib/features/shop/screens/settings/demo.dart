import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecom_app/features/shop/controllers/product/product_controller.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Featured Products'),
      ),
      body: Obx(() {
        if (productController.isLoad.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (productController.featuredProducts.isEmpty) {
          return Center(child: Text('No featured products available.'));
        }

        return ListView.builder(
          itemCount: productController.featuredProducts.length,
          itemBuilder: (context, index) {
            final product = productController.featuredProducts[index];
            return ProductCard(product: product);
          },
        );
      }),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.network(
              product.thumbnail,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text('Price: \$${product.price}'),
            if (product.salePrice > 0) ...[
              Text('Sale Price: \$${product.salePrice}'),
              Text(
                'Discount: ${productController.calculateSalePercentage(product.price, product.salePrice)}%',
                style: TextStyle(color: Colors.red),
              ),
            ],
            Text('Stock: ${product.stock}'),
            Text('Type: ${product.productType}'),
            if (product.brand != null) Text('Brand: ${product.brand!.name}'),
            if (product.description != null) Text('Description: ${product.description}'),
            if (product.images != null && product.images!.isNotEmpty) ...[
              SizedBox(height: 10),
              Text('Images:'),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: product.images!
                      .map((img) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(img, height: 100, width: 100, fit: BoxFit.cover),
                  ))
                      .toList(),
                ),
              ),
            ],
            if (product.productAttributes != null && product.productAttributes!.isNotEmpty) ...[
              SizedBox(height: 10),
              Text('Attributes:'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: product.productAttributes!
                    .map((attr) => Text('${attr.name}: ${attr.values}'))
                    .toList(),
              ),
            ],
            if (product.productVariations != null && product.productVariations!.isNotEmpty) ...[
              SizedBox(height: 10),
              Text('Variations:'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: product.productVariations!
                    .map((variation) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Variation: ${variation.attributeValues}'),
                    if (variation.image.isNotEmpty)
                      Image.network(variation.image, height: 50, width: 50, fit: BoxFit.cover),
                    Text('Price: \$${variation.price}'),
                    if (variation.salePrice > 0) Text('Sale Price: \$${variation.salePrice}'),
                  ],
                ))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
