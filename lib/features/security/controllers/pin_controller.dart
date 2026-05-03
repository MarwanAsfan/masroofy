import 'dart:async';
import 'package:get/get.dart';
import 'package:masroofy/features/security/repositories/security_repository.dart';
import 'package:masroofy/navigation_menu.dart';
import 'package:masroofy/utils/popups/loaders.dart';

class PinController extends GetxController {
  static PinController get instance => Get.find();

  final _securityRepository = SecurityRepository.instance;

  final RxString pin = ''.obs;
  final RxBool isLoading = false.obs;
  final RxString dots = ''.obs;
  final RxBool isSetup = false.obs;
  Timer? _timer;

  @override
  void onInit() {
    isSetup.value = _securityRepository.isSetup();
    super.onInit();
  }

  void startLoading() {
    isLoading.value = true;
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      dots.value = dots.value.length >= 3 ? '' : '${dots.value}.';
    });
    if (_securityRepository.isSetup()) {
      _securityRepository.setup(pin.value);
      Loaders.successSnackBar(
        title: 'PIN Created',
        message: 'redirecting to home screen',
      );
      Get.offAll(() => NavigationMenu());
    } else if (_securityRepository.checkPasskey(pin.value)) {
      Loaders.successSnackBar(
        title: 'Access Authorized',
        message: 'redirecting to home screen',
      );
      Get.offAll(() => NavigationMenu());
    } else {
      Loaders.errorSnackBar(
        title: 'Incorrect Pin',
        message: 'Please try again',
      );
    }
    isLoading.value = false;
  }

  void stopLoading() {
    _timer?.cancel();
    isLoading.value = false;
    dots.value = '';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void onKeyPressed(String value) {
    if (isLoading.value) return;
    if (pin.value.length < 4) {
      pin.value += value;
    }
  }

  void onRemove() {
    if (isLoading.value) return;
    if (pin.isNotEmpty) {
      pin.value = pin.value.substring(0, pin.value.length - 1);
    }
  }
}
