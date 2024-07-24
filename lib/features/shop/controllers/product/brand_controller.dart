import 'package:ecom_app/common/widgets/loader/loader.dart';
import 'package:ecom_app/data/repositories/product/repository_product.dart';
import 'package:ecom_app/features/shop/models/brand_model.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/brands/repository_brands.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();

  RxBool isLoad = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(RepositoryBrands());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void> getFeaturedBrands() async {
    try {
      isLoad.value = true;

      final brands = await brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(allBrands.where((brands) => brands.isFeatured ?? false).take(4));

    } catch (e) {
      ECustomSnackBar.showError(title: 'Oh snap!' , message: e.toString());
    } finally {
      isLoad.value = false;
    }
  }

  Future<List<BrandModel>> getBrandForProduct(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandForCategory(categoryId);
      return brands;
    } catch (e) {
      ECustomSnackBar.showError(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getBrandProduct({required String brandId, int limit = -1}) async{
    try {
      final products = await RepositoryProduct.instance.getProductsForBrand(brandId: brandId, limit: limit);
      return products;

    } catch (e) {
      ECustomSnackBar.showError(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}