import 'package:ecom_app/common/widgets/loader/loader.dart';
import 'package:ecom_app/data/repositories/product/repository_product.dart';
import 'package:ecom_app/features/shop/models/categories_model.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:get/get.dart';

import '../../../data/repositories/categories/repository_categories.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();

  final isLoad = false.obs;
  final _categoryRepository = Get.put(RepositoryCategories());
  RxList<CategoryModels> allCategories = <CategoryModels>[].obs;
  RxList<CategoryModels> featuredCategories = <CategoryModels>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  //Load category data
  Future<void> fetchCategories() async {
    try {
      //Loader
      isLoad.value = true;

      // Fetch categories from data source
      final categories = await _categoryRepository.getAllCategories();

      //Update the categories
      allCategories.assignAll(categories);

      // filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      // EFullScreenLoader.stopLoading();
      ECustomSnackBar.showError(title: 'Oh snap', message: e.toString());
    } finally {
      isLoad.value = false;
    }
  }

  // Load selected category data
  Future<List<CategoryModels>> getSubCategories(String categoryId) async {
    try {
      final subCategories = await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      ECustomSnackBar.showError(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // Get category or sub-category product
  Future<List<ProductModel>> getCategoryProduct({
    required String categoryId,
    int limit = 4,
  }) async {
    final products = await RepositoryProduct.instance
        .getProductForCategory(categoryId: categoryId, limit: limit);
    return products;
  }
}
