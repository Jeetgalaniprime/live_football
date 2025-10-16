import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/routes/app_routes.dart';
import 'package:football_live/service/mobile_ads/ad_helper.dart';
import 'package:football_live/utils/app_assets.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:football_live/utils/common_widget.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: 110.h,
              width: commonWidth,
              child: Text(
                "MatchLive: Football Live Score",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.h),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    AdHelper().showInterstitialAdOnClickEvent(() {
                      Get.toNamed(AppRoutes.homeScreen);
                    });
                  },
                  child: Image.asset(
                    AppAssets.scoreCardImage,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 10.h),
                Row(
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          AdHelper().showInterstitialAdOnClickEvent(() {
                            Get.toNamed(AppRoutes.winnersScreen);
                          });
                        },
                        child: Image.asset(
                          AppAssets.winnersCardImage,
                          width: commonWidth,
                          height: 218.h,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          AdHelper().showInterstitialAdOnClickEvent(() {
                            Get.toNamed(AppRoutes.pointTableScreen);
                          });
                        },
                        child: Image.asset(
                          AppAssets.pointTableCardImage,
                          width: commonWidth,
                          height: 218.h,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                /// big banner ads show hear
                adManager.showNativeAdsAd(AdType.nativeBig),
                SizedBox(height: 10.h),

                Row(
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          AdHelper().showInterstitialAdOnClickEvent(() {
                            Get.toNamed(AppRoutes.stadiumScreen);
                          });
                        },
                        child: Image.asset(
                          AppAssets.stadiumCardImage,
                          width: commonWidth,
                          height: 218.h,
                        ),
                      ),
                    ),
                    // SizedBox(width: 20.w),
                    SizedBox(width: 10.w),

                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          AdHelper().showInterstitialAdOnClickEvent(() {
                            Get.toNamed(AppRoutes.rankingScreen);
                          });
                        },
                        child: Image.asset(
                          AppAssets.rankingCardImage,
                          width: commonWidth,
                          height: 218.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: 15.w),
          ],
        ),
      ),
    );
  }
}

class CommonHomeBox extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onTap;

  const CommonHomeBox({
    super.key,
    required this.imagePath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200.h,
        width: commonWidth,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgView(AppAssets.arrowRight),
                ),
              ],
            ),
            SvgView(imagePath).paddingOnly(left: 16.w),
            SizedBox(height: 18.h),
            Text(
              title,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ).paddingOnly(left: 16.w),
          ],
        ),
      ),
    );
  }
}
