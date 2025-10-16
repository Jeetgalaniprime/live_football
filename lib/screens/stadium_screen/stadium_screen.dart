import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/common/common_appbar.dart';
import 'package:football_live/service/mobile_ads/ad_helper.dart';
import 'package:football_live/utils/app_assets.dart';
// import 'package:football_live/utils/app_colors.dart';

class StadiumScreen extends StatelessWidget {
  const StadiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.darkBgColor,
      bottomNavigationBar: adManager.showNativeAdsAd(AdType.nativeBig),
      appBar: CommonAppBar(title: 'Stadium'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AppAssets.stadium1Image),
                SizedBox(height: 20.h),
                Image.asset(AppAssets.stadium2Image),
                SizedBox(height: 20.h),
                Image.asset(AppAssets.stadium3Image),
                SizedBox(height: 20.h),
                Image.asset(AppAssets.stadium4Image),
                SizedBox(height: 20.h),
                Image.asset(AppAssets.stadium5Image),
                SizedBox(height: 20.h),
                Image.asset(AppAssets.stadium6Image),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
