import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/common/common_common_match_box.dart';
import 'package:football_live/routes/app_routes.dart';
import 'package:football_live/screens/home_screen/controller/home_controller.dart';
import 'package:football_live/service/mobile_ads/ad_helper.dart';

import 'package:get/get.dart';

class ScheduleScreen extends GetView<HomeScreenController> {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(() {
        controller.isLoading.value;
        final item = controller.leagueSchedule;
        return ListView.separated(
          padding: EdgeInsets.only(top: 10.h),
          itemCount: item.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                AdHelper().showInterstitialAdOnClickEvent(() {
                  Get.toNamed(
                    AppRoutes.matchDetailsScreen,
                    arguments: item[index].toJson(),
                  );
                });
              },
              child: CommonMatchBox(
                title: item[index].date,
                score: item[index].scoretime,
                team1Name: item[index].localteam,
                team1ImageUrl:
                    "https://static.holoduke.nl/footapi/images/teams_gs/${item[index].gsLocalteamid}_small.png",
                team2Name: item[index].visitorteam,
                team2ImageUrl:
                    "https://static.holoduke.nl/footapi/images/teams_gs/${item[index].gsVisitorteamid}_small.png",
                status: item[index].status,
              ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
            );
          },

          separatorBuilder: (context, index) {
            return SizedBox(height: 10.h);
          },
        );
      }),
    );
  }
}
