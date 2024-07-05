import 'package:ecom_app/common/widgets/loader/loader.dart';
import 'package:ecom_app/features/shop/models/categories_model.dart';
import 'package:ecom_app/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

import '../../../data/repositories/categories/repository_categories.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();

  final isLoad = false.obs;
  final _categoryReponsitory = Get.put(RepositoryCategories());
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
      final categories = await _categoryReponsitory.getAllCategories();

      //Update the categories
      allCategories.assignAll(categories);

      // filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) =>
              category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      // EFullScreenLoader.stopLoading();
      ECustomSnackBar.showError(title: 'Oh snap', message: e.toString());
    } finally {
      isLoad.value = false;
    }
  }
}
