import 'dart:convert';

import 'package:ecom_app/common/widgets/loader/loader.dart';
import 'package:ecom_app/data/repositories/product/repository_product.dart';
import 'package:ecom_app/features/shop/models/product_model.dart';
import 'package:ecom_app/features/shop/screens/home/home.dart';
import 'package:ecom_app/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';
import '../screens/wishList/wishlist.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  Future<void> initFavorites() async {
    final json = ELocalStorage.instance().readData('favorites');
    if (json != null) {
      final storageFavorite = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storageFavorite.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

   toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId) || !favorites[productId]!) {
      favorites[productId] = true;
      ECustomSnackBar.customToast(
        message: 'The product has been added to favorites',
        onTap: () => Get.to(() => const WishList()),
        note: 'Click, go to the Wishlist screen',
      );
    } else {
      favorites.remove(productId);
      ECustomSnackBar.customToast(
        message: 'The product has been removed from favorites',
        onTap: () => Get.to(() => const HomeScreen()),
        note: 'Click, go to the Home screen',
      );
    }
    saveFavoriteToStorage();
    favorites.refresh(); // Refresh the favorites map to trigger UI update
  }

  void saveFavoriteToStorage() {
    final encodeFavorite = json.encode(favorites);
    ELocalStorage.instance().saveData('favorites', encodeFavorite);
  }

  Future<List<ProductModel>> favoriteProduct() async {
    final productIds = favorites.keys.where((key) => favorites[key] == true).toList();
    if (productIds.isEmpty) return [];
    return await RepositoryProduct.instance.getFavoriteProducts(productIds);
  }
}
