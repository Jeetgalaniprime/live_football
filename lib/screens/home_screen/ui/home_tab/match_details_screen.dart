import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/common/common_appbar.dart';
import 'package:football_live/common/common_image.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:football_live/utils/common_widget.dart';
import 'package:get/get.dart';

import '../../../../models/league_schedule_model.dart';

class MatchDetailsScreen extends StatelessWidget {
  const MatchDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LeagueScheduleModel item = LeagueScheduleModel.fromJson(
      Get.arguments,
    );

    return Scaffold(
      appBar: CommonAppBar(
        title: item.leaguename ?? '',
        titleTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        centerTitle: false,
      ),

      body: Column(
        children: [
          SizedBox(height: 10.h),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.all(12.sp),
            width: commonWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CommonNetworkImage(
                      height: 50.h,
                      width: 50.w,
                      imageUrl:
                          "https://static.holoduke.nl/footapi/images/teams_gs/${item.gsLocalteamid}_small.png",
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      item.localteam ?? '',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      item.date ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      item.scoretime ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      item.status ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    CommonNetworkImage(
                      height: 50.h,
                      width: 50.w,
                      imageUrl:
                          "https://static.holoduke.nl/footapi/images/teams_gs/${item.gsVisitorteamid}_small.png",
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      item.visitorteam ?? '',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ).paddingSymmetric(horizontal: 10.w),
        ],
      ),
    );
  }
}
