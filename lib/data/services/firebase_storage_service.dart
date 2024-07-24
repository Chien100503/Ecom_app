import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../features/shop/models/product_model.dart';

class EFirebaseStorageService extends GetxController {
  static EFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  Future<Uint8List> getImageDataFromAssets(String path) async{
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'error loading images: $e';
    }
  }

  Future<String> uploadImageData(String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase exception ${e.message}';
      } else if (e is SocketException) {
        throw 'Network error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform exception: ${e.message}';
      } else {
        throw 'Something went wrong, please try again';
      }
    }
  }

  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase exception ${e.message}';
      } else if (e is SocketException) {
        throw 'Network error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform exception: ${e.message}';
      } else {
        throw 'Something went wrong, please try again';
      }
    }
  }

  Future<void> addProduct(ProductModel product) async {
    await FirebaseFirestore.instance.collection('Products').add({
      'Title': product.title,
      'TitleLower': product.title.toLowerCase(), // Store title in lowercase
      'Price': product.price,
      'Thumbnail': product.thumbnail,
      // Add other fields as necessary
    });
  }
}