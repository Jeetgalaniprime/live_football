import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/common/common_appbar.dart';
import 'package:football_live/service/mobile_ads/ad_helper.dart';
import 'package:football_live/utils/app_assets.dart';
import 'package:football_live/utils/app_colors.dart';

class WinnersScreen extends StatelessWidget {
  const WinnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.darkBgColor,
      appBar: CommonAppBar(title: 'Winners'),
      bottomNavigationBar: adManager.showNativeAdsAd(AdType.nativeBig),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AppAssets.winner1Image),
                SizedBox(height: 20.h),
                Image.asset(AppAssets.winner2Image),
                SizedBox(height: 20.h),
                Image.asset(AppAssets.winner3Image),
                SizedBox(height: 20.h),
                Image.asset(AppAssets.winner4Image),
                SizedBox(height: 20.h),
                Image.asset(AppAssets.winner5Image),
                SizedBox(height: 20.h),
                Image.asset(AppAssets.winner6Image),
                SizedBox(height: 20.h),
                Image.asset(AppAssets.winner7Image),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
