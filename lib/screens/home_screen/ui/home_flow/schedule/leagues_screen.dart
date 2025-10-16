import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/common/common_appbar.dart';
import 'package:football_live/common/common_image.dart';
import 'package:football_live/routes/app_routes.dart';
import 'package:football_live/screens/home_screen/controller/home_controller.dart';
import 'package:football_live/service/mobile_ads/ad_helper.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:get/get.dart';

class LeaguesScreen extends GetView<HomeScreenController> {
  const LeaguesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic argIndex = Get.arguments != null
        ? Get.arguments['index'] ?? ''
        : null;
    final int feedIndex = argIndex is int
        ? argIndex
        : int.tryParse(argIndex?.toString() ?? '0') ?? 0;

    return Scaffold(
      // backgroundColor: AppColors.bgColor,
      appBar: CommonAppBar(title: controller.feedList[feedIndex].country ?? ''),
      body: controller.feedList[feedIndex].leagues.isNotEmpty
          ? ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
              itemBuilder: (context, index) {
                final item = controller.feedList[feedIndex].leagues[index];
                return InkWell(
                  onTap: () {
                    AdHelper().showInterstitialAdOnClickEvent(() {
                      Get.toNamed(
                        AppRoutes.leaguesDetailsScreen,
                        arguments: {'index': feedIndex, 'leagueIndex': index},
                      );
                    });
                  },
                  child: Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.whiteColor.withValues(alpha: .7),
                        ),
                        BoxShadow(
                          color: AppColors.primaryColor,
                          spreadRadius: -1.0,
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 15.h,
                          ),
                          child: CommonNetworkImage(
                            imageUrl:
                                'https://static.holoduke.nl/footapi/images/flags/${(controller.feedList[feedIndex].country ?? '').replaceAll(' ', '-').toLowerCase()}.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        // SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            item.leagueName ?? '',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                if (index % 10 == 0) {
                  return adManager.showNativeAdsAd(AdType.nativeBig);
                } else {
                  return SizedBox(height: 20.h);
                }
              },
              itemCount: controller.feedList[feedIndex].leagues.length,
            )
          : Center(
              child: Text(
                'No leagues found',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
            ),
    );
  }
}
