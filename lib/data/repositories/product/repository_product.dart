import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/data/services/firebase_storage_service.dart';
import 'package:ecom_app/utils/exceptions/firebase_exception.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/enums.dart';
class RepositoryProduct extends GetxController {
  static RepositoryProduct get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      print('Querying Firestore for featured products...');
      final snapshot = await _db.collection("Products").where('IsFeatured', isEqualTo: true).limit(6).get();
      print('Firestore query returned ${snapshot.docs.length} documents');
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      print('FirebaseException: $e');
      throw EFirebaseException(e.code).message;
    } catch (e) {
      print('Exception: $e');
      throw e.toString();
    }
  }

  // upload image data to the cloud firebase
  Future<void> uploadImageData(List<ProductModel> products) async {
    try {
      // upload all the product along with their images
      final storage = Get.put(EFirebaseStorageService());

      // loop through each product
      for (var product in products) {
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        // upload image and get url
        final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());

        // Assign URL to product.thumbnail attributes
        product.thumbnail = url;

        // product of list images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];

          for (var image in product.images!) {
            final assetImage = await storage.getImageDataFromAssets(image);

            final url = await storage.uploadImageData('Products/Images', assetImage, image);

            // Assign URL to product.thumbnail attributes
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            // upload image and get its url
            final url = await storage.uploadImageData('Products/Images', assetImage, variation.image);

            variation.image = url;
          }
        }

        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }
}
