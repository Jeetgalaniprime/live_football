import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {
  final String assetPath;
  final String? url;
  final double? width;
  final double? height;
  final bool repeat;
  final bool animate;
  final BoxFit fit;

  const LottieAnimation({
    super.key,
    this.assetPath = '',
    this.url,
    this.width,
    this.height,
    this.repeat = true,
    this.animate = true,
    this.fit = BoxFit.contain,
  }) : assert(assetPath != '' || url != null, 'Provide either assetPath or url');

  @override
  Widget build(BuildContext context) {
    if (url != null) {
      return Lottie.network(
        url!,
        width: width,
        height: height,
        repeat: repeat,
        animate: animate,
        fit: fit,
      );
    }

    return Lottie.asset(
      assetPath,
      width: width,
      height: height,
      repeat: repeat,
      animate: animate,
      fit: fit,
    );
  }
}
