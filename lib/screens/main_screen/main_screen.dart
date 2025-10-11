import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/routes/app_routes.dart';
import 'package:football_live/utils/app_assets.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.homeScreen);
                },
                child: Image.asset(AppAssets.scoreCardImage)),
              SizedBox(height: 20.h),
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.winnersScreen);
                },
                child: Image.asset(AppAssets.winnersCardImage)),
              SizedBox(height: 20.h),
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.pointTableScreen);
                },
                child: Image.asset(AppAssets.pointTableCardImage)),
              SizedBox(height: 20.h),
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.stadiumScreen);
                },
                child: Image.asset(AppAssets.stadiumCardImage)),
              SizedBox(height: 20.h),
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.rankingScreen);
                },
                child: Image.asset(AppAssets.rankingCardImage)),
            ],
          ),
        ),
      ),
    );
  }
}
