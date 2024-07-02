import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecom_app/common/widgets/loader/loader.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _subscription;
  final Rx<ConnectivityResult> _connectionResult = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _subscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onClose() {
    super.onClose();
    _subscription.cancel();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async{
    _connectionResult.value = result;
    if(_connectionResult.value == ConnectivityResult.none) {
      ECustomSnackBar.showWarning(title: 'No internet connection');
    }
  }

  Future<bool> isConnected() async{
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }
}
