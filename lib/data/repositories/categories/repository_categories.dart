import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/features/shop/models/categories_model.dart';
import 'package:ecom_app/utils/exceptions/firebase_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../services/firebase_storage_service.dart';

class RepositoryCategories extends GetxController{
  static RepositoryCategories get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Get all categories
  Future<List<CategoryModels>> getAllCategories() async{
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModels.fromSnapshot(document)).toList();
      print('----------- ${list.length}');
      return list;


    } on FirebaseAuthException catch(e) {
      throw EFirebaseException(e.code).message;
    } catch (e) {
      rethrow;
    }
  }

  // Get sub categories
  Future<List<CategoryModels>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db.collection("Categories").where('ParentId', isEqualTo: categoryId).get();
      final result = snapshot.docs.map((e) => CategoryModels.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } catch (e) {
      rethrow;
    }
  }



  // // Upload categories firebase
  Future<void> uploadCategoryData(List<CategoryModels> categories) async {
    try {
      // Upload all the categories along with their image
      final storage = Get.put(EFirebaseStorageService());

      // logo through each category
      for (var category in categories) {
        final file = await storage.getImageDataFromAssets(category.image);

        final url = await storage.uploadImageData('Categories', file, category.name);

        category.image = url;

        // Store category in fireStore
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } catch (e) {
      rethrow;
    }
  }
}