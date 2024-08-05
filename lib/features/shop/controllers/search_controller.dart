import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class ProductSearchController extends GetxController {
  static ProductSearchController get instance => Get.find();
  var searchQuery = ''.obs;
  var allProducts = <ProductModel>[].obs;
  var filteredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('Products').get();
      List<ProductModel> products = snapshot.docs
          .map((doc) =>
              ProductModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      allProducts.value = products;
      filterProducts(searchQuery.value);
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  void onSearchChanged(String value) {
    searchQuery.value = value.toLowerCase();
    filterProducts(searchQuery.value);
  }

  void filterProducts(String query) {
    filteredProducts.value = allProducts
        .where((product) => product.title.toLowerCase().contains(query))
        .toList();
  }
}
