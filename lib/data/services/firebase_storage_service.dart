import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EFirebaseStorageService extends GetxController {
  static EFirebaseStorageService get instance => Get.find();

  final _firabaseStorage = FirebaseStorage.instance;

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
      final ref = _firabaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase exception ${e.message}';
      } else if (e is SocketException) {
        throw 'Network error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform exceoption: ${e.message}';
      } else {
        throw 'Something went wrong, please try again';
      }
    }
  }

  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firabaseStorage.ref(path).child(image.name);
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
}