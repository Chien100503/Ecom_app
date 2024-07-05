import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/features/shop/models/banner_model.dart';
import 'package:ecom_app/utils/exceptions/firebase_exception.dart';
import 'package:get/get.dart';

class RepositoryBanners extends GetxController {
  static RepositoryBanners get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanner() async {
    try {
      final result = await _db.collection("Banners").where('Active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();

    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }
}