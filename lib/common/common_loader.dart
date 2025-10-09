import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class CommonLoader extends StatelessWidget {
  final Color? color;
  final double? size;
  final double? strokeWidth;

  const CommonLoader({super.key, this.color, this.size, this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? 40.w,
        height: size ?? 40.h,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? 4,
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
