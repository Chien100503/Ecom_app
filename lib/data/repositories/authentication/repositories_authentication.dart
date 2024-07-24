import 'package:ecom_app/data/repositories/user/user_repository.dart';
import 'package:ecom_app/features/authentication/screens/loggin/login.dart';
import 'package:ecom_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecom_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecom_app/navigation_menu.dart';
import 'package:ecom_app/utils/exceptions/firebase_exception.dart';
import 'package:ecom_app/utils/local_storage/storage_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';


class RepositoriesAuthentication extends GetxController {
  static RepositoriesAuthentication get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    super.onReady();
    // Remove splash screen and redirect based on user status
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        await ELocalStorage.init(user.uid);
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
  Future<UserCredential?> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw EFirebaseException(e.code).message;
    } catch (e) {
      rethrow;
    }
  }

  /// [REGISTER]
  Future<UserCredential> registerEmailWithPassword(String email, String password) async {
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

  /// [FORGET_PASSWORD]
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw EFirebaseException(e.code).message;
    } catch (e) {
      throw 'Some thing went wrong, please try again';
    }
  }

  /// [GoogleAuthentication]
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
      // create a new credential
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw EFirebaseException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  /// [Logout User]
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.to(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw EFirebaseException(e.code).message;
    } catch (e) {
      throw 'Some thing went wrong, please try again';
    }
  }

  /// [ReAuthenticate]
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      // Create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw EFirebaseException(e.code).message;
    } catch (e) {
      rethrow;
    }
  }

  ///[Delete_Account]
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw EFirebaseException(e.code).message;
    } catch (e) {
      rethrow;
    }
  }
}
