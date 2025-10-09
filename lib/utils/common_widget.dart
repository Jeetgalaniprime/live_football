import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:get/get.dart';

final double commonWidth = MediaQuery.sizeOf(Get.context!).width;

final double commonHeight = MediaQuery.sizeOf(Get.context!).height;

class SvgView extends StatelessWidget {
  const SvgView(
    this.svg, {
    super.key,
    this.color,
    this.height,
    this.width,
    this.onTap,
    this.padding,
    this.fit = BoxFit.contain,
    this.network = false,
  });

  final String svg;
  final Color? color;
  final double? height, width;
  final BoxFit fit;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final bool network;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: network
            ? SvgPicture.network(
                svg,
                colorFilter: color != null
                    ? ColorFilter.mode(
                        color ?? AppColors.whiteColor,
                        BlendMode.srcIn,
                      )
                    : null,
                height: height,
                width: width,
                fit: fit,
              )
            : SvgPicture.asset(
                svg,
                colorFilter: color != null
                    ? ColorFilter.mode(
                        color ?? AppColors.whiteColor,
                        BlendMode.srcIn,
                      )
                    : null,
                height: height,
                width: width,
                fit: fit,
              ),
      ),
    );
  }
}
