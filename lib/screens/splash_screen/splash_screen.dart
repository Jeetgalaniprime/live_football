import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/routes/app_routes.dart';
import 'package:football_live/service/mobile_ads/ad_helper.dart';
import 'package:get/get.dart';
import '../../common/common_lottie.dart';
import '../../utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    adManager.initialize();
    Future.delayed(const Duration(seconds: 3), () async {
      Get.offNamed(AppRoutes.mainScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.splashImage,
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: Center(
              child: LottieAnimation(
                assetPath: AppAssets.loadingAnimation,
                fit: BoxFit.contain,
                height: 300.h,
                width: 130.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
