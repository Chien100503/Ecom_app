import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/data/repositories/authentication/repositories_authentication.dart';
import 'package:ecom_app/features/personalization/models/address_model.dart';
import 'package:get/get.dart';

class RepositoryAddress extends GetxController {
  static RepositoryAddress get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      final userId = RepositoriesAuthentication.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes';
      }

      final result =
          await _db.collection("Users").doc(userId).collection('Addresses').get();
      return result.docs
          .map(
              (documentSnapshot) => AddressModel.fromSnapShot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Something went wrong! Please, try again later';
    }
  }

  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = RepositoriesAuthentication.instance.authUser!.uid;
      await _db
          .collection("Users")
          .doc(userId)
          .collection('Addresses')
          .doc(addressId)
          .update({'SelectedAddress': selected});
     } catch (e) {
      throw 'Unable to find user information. Try again later';
    }
  }

  Future<String> address(AddressModel address) async {
    try {
      final userId = RepositoriesAuthentication.instance.authUser!.uid;
      final currentAddress = await _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editAddress(AddressModel address) async {
    try {
      final userId = RepositoriesAuthentication.instance.authUser!.uid;
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .doc(address.id) // Assuming the address model has an ID field
          .update(address.toJson());
    } catch (e) {
      throw 'Unable to update address. Please, try again later';
    }
  }
  Future<void> deleteAddress(String addressId) async {
    try {
      final userId = RepositoriesAuthentication.instance.authUser!.uid;
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .doc(addressId)
          .delete();
    } catch (e) {
      throw 'Unable to delete address. Please, try again later';
    }
  }
}

