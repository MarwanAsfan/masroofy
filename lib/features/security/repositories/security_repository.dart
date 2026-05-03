import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:masroofy/features/security/screens/pin_screen.dart';

class SecurityRepository extends GetxController {
  static SecurityRepository get instance => Get.find();
  final _localStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    redirectToDashboard();
  }

  void redirectToDashboard() {
    Get.offAll(() => const PinScreen());
  }

  bool checkSecurity() {
    return true;
  }

  bool isSetup() => !_localStorage.hasData('setup');

  void setup(String passKey) {
    _localStorage.writeIfNull('setup', true);
    _localStorage.write('key', passKey);
  }

  bool checkPasskey(String passKey) {
    final String storedKey = (_localStorage.read('key') ?? '') as String;
    return storedKey == passKey;
  }
}
