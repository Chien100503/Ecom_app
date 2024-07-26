import 'package:ecom_app/features/authentication/screens/loggin/login.dart';
import 'package:ecom_app/features/authentication/screens/signup/signup.dart';
import 'package:ecom_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecom_app/features/checkout/order/order.dart';
import 'package:ecom_app/features/personalization/screens/addresses/address.dart';
import 'package:ecom_app/features/shop/screens/home/home.dart';
import 'package:ecom_app/features/shop/screens/profile/profile.dart';
import 'package:ecom_app/features/shop/screens/review/review_and_rating.dart';
import 'package:ecom_app/features/shop/screens/settings/setting.dart';
import 'package:ecom_app/features/shop/screens/store/store.dart';
import 'package:ecom_app/features/shop/screens/wishList/wishlist.dart';
import 'package:ecom_app/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages =[
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.store, page: () => const Store()),
    GetPage(name: Routes.favorite, page: () => const WishList()),
    GetPage(name: Routes.setting, page: () => const Setting()),
    GetPage(name: Routes.userProfile, page: () => const Profile()),
    GetPage(name: Routes.order, page: () => const OrderScreen()),
    GetPage(name: Routes.productReviews, page: () => const ReviewAndRating()),
    // GetPage(name: Routes.productDetail, page: () => const ProductDetail()),
    GetPage(name: Routes.signIn, page: () => const LoginScreen()),
    GetPage(name: Routes.signup, page: () => const SignupScreen()),
    GetPage(name: Routes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: Routes.userAddress, page: () => const AddressScreen()),
    GetPage(name: Routes.userAddress, page: () => const AddressScreen()),

  ];
}