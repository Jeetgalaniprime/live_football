import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class CustomBackArrow extends StatefulWidget {
  const CustomBackArrow({super.key});

  @override
  State<CustomBackArrow> createState() => _CustomBackArrowState();
}

class _CustomBackArrowState extends State<CustomBackArrow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: InkWell(
        splashColor: AppColors.transparentColor,
        highlightColor: AppColors.transparentColor,
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: AppColors.whiteColor,
          size: 25.sp,
        ),
      ),
    );
  }
}
