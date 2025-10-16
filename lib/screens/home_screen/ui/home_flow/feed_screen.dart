import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/common/common_image.dart';
import 'package:football_live/routes/app_routes.dart';
import 'package:football_live/screens/home_screen/controller/home_controller.dart';
import 'package:football_live/service/mobile_ads/ad_helper.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FeedScreen extends GetView<HomeScreenController> {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
              itemBuilder: (context, index) {
                final item = controller.feedList[index];
                return InkWell(
                  onTap: () {
                    AdHelper().showInterstitialAdOnClickEvent(() {
                      Get.toNamed(
                        AppRoutes.leaguesScreen,
                        arguments: {'index': index},
                      );
                    });
                  },
                  child: Container(
                    height: 70.h,
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
                            horizontal: 15.w,
                            vertical: 15.h,
                          ),
                          child: CommonNetworkImage(
                            imageUrl:
                                'https://static.holoduke.nl/footapi/images/flags/${(item.country ?? '').replaceAll(' ', '-').toLowerCase()}.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        // SizedBox(width: 10.w),
                        Text(
                          item.country ?? '',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500,
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
              itemCount: controller.feedList.length,
            ),
    );
  }
}
