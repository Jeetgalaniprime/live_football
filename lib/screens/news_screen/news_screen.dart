import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/common/common_image.dart';
import 'package:football_live/routes/app_routes.dart';
import 'package:football_live/screens/home_screen/controller/home_controller.dart';
import 'package:football_live/service/mobile_ads/ad_helper.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:get/get.dart';

class NewsScreen extends GetView<HomeScreenController> {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              AdHelper().showInterstitialAdOnClickEvent(() {
                Get.toNamed(
                  AppRoutes.newsDetails,
                  arguments: {
                    'title': controller.newsList[index].title ?? '',
                    'link': controller.newsList[index].link ?? '',
                  },
                );
              });
            },
            child: Container(
              height: 100.h,
              // color: AppColors.bgColor,
              child: Row(
                children: [
                  CommonNetworkImage(
                    imageUrl: controller.newsList[index].image ?? '',
                    height: 80.h,
                    width: 70.w,
                    borderRadius: 50,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.newsList[index].title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          controller.newsList[index].date ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
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
            return Divider(
              height: 1,
              color: AppColors.greyColor.withValues(alpha: 0.4),
            );
          }
        },
        itemCount: controller.newsList.length,
      ),
    );
  }
}
