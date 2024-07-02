import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/features/authentication/screens/loggin/login.dart';
import 'package:ecom_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecom_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecom_app/navigation_menu.dart';
import 'package:ecom_app/utils/exceptions/firebase_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RepositoriesAuthentication extends GetxController {
  static RepositoriesAuthentication get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  late Rx<User?> _user;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(_auth.currentUser);
    _user.bindStream(_auth.userChanges());

    // Remove splash screen and redirect based on user status
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(
          () => VerifyEmailScreen(
            email: _auth.currentUser?.email,
          ),
        );
      }
    } else {
      // Local storage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  /// [LOGIN]
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw EFirebaseException(e.code).message;
    } catch (e) {
      rethrow;
    }
  }

  /// [REGISTER]
  Future<UserCredential> registerEmailWithPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw EFirebaseException(e.code).message;
    } catch (e) {
      rethrow;
    }
  }

  /// [VERIFY]
  Future<void> sendEmailVerify() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw EFirebaseException(e.code).message;
    } catch (e) {
      throw 'Some thing went wrong, please try again';
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.to(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw EFirebaseException(e.code).message;
    } catch (e) {
      throw 'Some thing went wrong, please try again';
    }
  }
}
