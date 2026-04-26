import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class SecurityRepository extends GetxController {
  static SecurityRepository get instance => Get.find();

  /// Function that is called on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();

    screenRedirect();
  }

  Future<void> screenRedirect() async {}

  bool checkSecurity() {
    return true;
  }
}
