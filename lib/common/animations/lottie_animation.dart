import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {
  final String asset;
  final double? width;
  final double? height;

  const LottieAnimation({
    super.key,
    required this.asset,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      asset,
      fit: BoxFit.contain,
      height: height,
      width: width,
    );
  }
}
