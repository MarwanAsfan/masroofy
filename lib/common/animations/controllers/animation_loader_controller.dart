import 'dart:async';
import 'package:get/get.dart';

class BlinkingDotsController extends GetxController {
  RxString dots = ''.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    // Updates every 500ms
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (dots.value.length >= 3) {
        dots.value = ''; // Reset
      } else {
        dots.value += '.'; // Add dot
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel(); // Stop timer to prevent memory leaks
    super.onClose();
  }
}