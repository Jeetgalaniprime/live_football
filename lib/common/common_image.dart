import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/app_colors.dart';

class CommonNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CommonNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  });

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor.withValues(alpha: 0.5),
      highlightColor: AppColors.greyColor.withValues(alpha: 0.1),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius ?? 15)
              : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => placeholder ?? _buildShimmerEffect(),
      errorWidget: (context, url, error) =>
          errorWidget ??
          Center(
            child: Icon(Icons.error, color: AppColors.greyColor[400]),
          ),
    );

    return borderRadius != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            child: image,
          )
        : image;
  }
}
