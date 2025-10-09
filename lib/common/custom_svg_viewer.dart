import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgViewer extends StatelessWidget {
  const SvgViewer({
    super.key,
    required this.path,
    this.isNetwork = false,
    this.width = 40,
    this.height = 40,
    this.backgroundColor,
    this.borderRadius = 0,
  });

  final String path;
  final bool isNetwork;
  final double width;
  final double height;
  final Color? backgroundColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    Widget svg = isNetwork
        ? SvgPicture.network(
            path,
            width: width,
            height: height,
            placeholderBuilder: (context) => const CircularProgressIndicator(),
          )
        : SvgPicture.asset(path, width: width, height: height);

    if (backgroundColor != null) {
      return Container(
        width: width + 16,
        height: height + 16,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: svg,
      );
    }

    return svg;
  }
}
