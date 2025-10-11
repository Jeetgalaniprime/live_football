import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double elevation;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final Brightness? brightness;
  final IconThemeData? iconTheme;
  final TextStyle? titleTextStyle;
  final bool showBackButton;

  const CommonAppBar({
    super.key,
    required this.title,
    this.actions,
    this.backgroundColor,
    this.elevation = 0.0,
    this.centerTitle = false,
    this.bottom,
    this.brightness,
    this.iconTheme,
    this.titleTextStyle,
    this.showBackButton = true,
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style:
            titleTextStyle ??
            TextStyle(
              color: AppColors.whiteColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
      ),
      actions: actions,
      leading: showBackButton
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.whiteColor,
              ),
            )
          : null,
      automaticallyImplyLeading: showBackButton,
      elevation: elevation,
      centerTitle: centerTitle,
      bottom: bottom,
      iconTheme: iconTheme ?? IconThemeData(color: AppColors.blackColor),
      backgroundColor: backgroundColor ?? AppColors.primaryColor,
    );
  }
}
