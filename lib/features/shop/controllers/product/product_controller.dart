import 'package:ecom_app/common/widgets/loader/loader.dart';
import 'package:ecom_app/data/repositories/product/repository_product.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:ecom_app/utils/constants/enums.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoad = false.obs;
  final productRepository = Get.put(RepositoryProduct());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoad.value = true;
      // Fetch products
      final products = await productRepository.getFeaturedProducts();
      // assign products
      featuredProducts.assignAll(products);
    } catch (e) {
      ECustomSnackBar.showError(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoad.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final product = await productRepository.getFeaturedProducts();
      return product;
    } catch (e) {
      ECustomSnackBar.showError(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // Get the product price or price range for variation
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else{
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  // calculate discount percentage
  String? calculateSalePercentage(double originPrice, double salePrice) {
    if(salePrice == null || salePrice <= 0.0) return null;
    if(originPrice <= 0) return null;

    double percentage = ((originPrice - salePrice) / originPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In stock' : 'Out of stock';
  }
}
