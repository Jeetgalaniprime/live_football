import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double height;
  final double? width;
  final double borderRadius;
  final bool isLoading;
  final IconData? icon;
  final BoxShape boxShape;
  final Widget? child;
  final double? textSize;
  final Color? borderColor;

  const CustomButton({
    super.key,
    this.text = '',
    required this.onPressed,
    this.color = AppColors.primaryColor,
    this.textColor = AppColors.blackColor,
    this.height = 55,
    this.width,
    this.borderRadius = 50,
    this.isLoading = false,
    this.icon,
    this.boxShape = BoxShape.rectangle,
    this.child,
    this.textSize = 18,
    this.borderColor = AppColors.transparentColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height.h,
        width: width?.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          shape: boxShape,
          border: Border.all(
            color: borderColor ?? AppColors.transparentColor,
            width: 2,
          ),
        ),
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: textColor),
                  SizedBox(width: 8.w),
                ],
                Expanded(
                  child: Center(
                    child: Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: textSize?.sp ?? 24.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
