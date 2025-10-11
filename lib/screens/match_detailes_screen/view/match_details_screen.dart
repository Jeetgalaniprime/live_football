import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/common/common_appbar.dart';
import 'package:football_live/common/common_image.dart';
import 'package:football_live/models/match_detailes_model.dart';
import 'package:football_live/screens/match_detailes_screen/controller/match_detailes_controller.dart';
import 'package:football_live/utils/app_assets.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:football_live/utils/common_widget.dart';
import 'package:get/get.dart';

import '../../../models/league_schedule_model.dart';

class MatchDetailsScreen extends GetView<MatchDetailesController> {
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
          ),

          SizedBox(height: 10.h),
          Container(
            height: 50.h,
            width: commonWidth,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TabBar(
              controller: controller.tabController,

              labelColor: AppColors.blackColor,
              unselectedLabelColor: AppColors.blackColor.withValues(alpha: .5),
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              indicator: null,
              tabs: [
                Tab(text: "Match Info"),
                Tab(text: "Lineups"),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                GetBuilder(
                  init: controller,
                  initState: (_) {
                    controller.fetchMatchDetails(item.id ?? '');
                  },
                  builder: (_) {
                    return _MatchInfo();
                  },
                ),

                _Lineups(),
              ],
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 10.w),
    );
  }
}

class _MatchInfo extends GetView<MatchDetailesController> {
  const _MatchInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.isLoading.value;
      final data = controller.matchDetailesData.value;
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h, width: commonWidth),
            Card(
              child: Column(
                children: [
                  SizedBox(height: 10.h, width: commonWidth),
                  Text(
                    data.leaguename ?? '',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h, width: commonWidth),
                  Text(
                    data.venue ?? '',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.h, width: commonWidth),
                ],
              ),
            ),

            SizedBox(height: 10.h, width: commonWidth),
            Row(
              children: [
                Flexible(
                  child: Container(
                    height: 1.5,
                    width: commonWidth,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  "KEY EVENTS",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: Container(
                    height: 1.5,
                    width: commonWidth,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.events?.length ?? 0,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (data.events?[index].team == "localteam") {
                  return Row(
                    children: [
                      CommonNetworkImage(
                        imageUrl:
                            "http://static.holoduke.nl/footapi/images/playerimages/${data.events?[index].playerId ?? ''}.png",
                        height: 40.w,
                        width: 40.w,
                        borderRadius: 20.r,
                      ),
                      Text(
                        data.events?[index].player ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      SvgView(AppAssets.football, height: 18.w, width: 18.w),
                      SizedBox(width: 10.w),
                      Text(
                        "${data.events?[index].minute ?? ''}`",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                      Spacer(),
                    ],
                  ).paddingSymmetric(vertical: 5.h);
                } else if (data.events?[index].team == "visitorteam") {
                  return Row(
                    children: [
                      Spacer(),
                      Text(
                        "${data.events?[index].minute ?? ''}`",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      SvgView(AppAssets.football, height: 18.w, width: 18.w),
                      SizedBox(width: 10.w),
                      Text(
                        data.events?[index].player ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),

                      CommonNetworkImage(
                        imageUrl:
                            "http://static.holoduke.nl/footapi/images/playerimages/${data.events?[index].playerId ?? ''}.png",
                        height: 40.w,
                        width: 40.w,
                        borderRadius: 20.r,
                      ),
                    ],
                  ).paddingSymmetric(vertical: 5.h);
                } else {
                  return SizedBox();
                }
              },
            ),

            SizedBox(height: 10.h, width: commonWidth),

            if (data.commentaries?.stats != null)
              Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          height: 1.5,
                          width: commonWidth,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "STATISTICS",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Flexible(
                        child: Container(
                          height: 1.5,
                          width: commonWidth,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h, width: commonWidth),

                  Card(
                    child: Column(
                      children: List.generate(
                        data.commentaries?.stats?.localteam
                                ?.toJson()
                                .keys
                                .length ??
                            0,
                        (index) {
                          return Row(
                            children: [
                              Text(
                                data.commentaries?.stats?.localteam
                                        ?.toJson()
                                        .values
                                        .elementAt(index) ??
                                    '',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                ),
                              ),
                              Spacer(),
                              Text(
                                data.commentaries?.stats?.localteam
                                        ?.toJson()
                                        .keys
                                        .elementAt(index) ??
                                    '',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                ),
                              ),
                              Spacer(),
                              Text(
                                data.commentaries?.stats?.visitorteam
                                        ?.toJson()
                                        .values
                                        .elementAt(index) ??
                                    '',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ).paddingSymmetric(vertical: 5.h);
                        },
                      ),
                    ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
                  ),
                ],
              ),

            if (data.stats != null)
              Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          height: 1.5,
                          width: commonWidth,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "HEAD 2 HEAD",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Flexible(
                        child: Container(
                          height: 1.5,
                          width: commonWidth,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h, width: commonWidth),

                  Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              (data.stats?.totalLocalteamWon ?? 0).toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "WINS",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                            Spacer(),
                            Text(
                              (data.stats?.totalVisitorteamWon ?? 0).toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h, width: commonWidth),
                        Row(
                          children: [
                            Text(
                              (data.stats?.totalLocalteamScored ?? 0)
                                  .toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Goals For",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                            Spacer(),
                            Text(
                              (data.stats?.totalVisitorteamScored ?? 0)
                                  .toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
                  ),
                ],
              ),
          ],
        ),
      );
    });
  }
}

class _Lineups extends GetView<MatchDetailesController> {
  const _Lineups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final data = controller.matchDetailesData.value;

      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// LOCAL TEAM
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(data.lineups?.localteam?.length ?? 0, (
                  index,
                ) {
                  final player = data.lineups?.localteam?[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Row(
                      children: [
                        CommonNetworkImage(
                          imageUrl:
                              "http://static.holoduke.nl/footapi/images/playerimages/${player?.id ?? ''}.png",
                          height: 50.w,
                          width: 50.w,
                          borderRadius: 25.w,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            player?.name ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),

            SizedBox(width: 10.w),

            /// VISITOR TEAM
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(data.lineups?.visitorteam?.length ?? 0, (
                  index,
                ) {
                  final player = data.lineups?.visitorteam?[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            player?.name ?? '',
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        CommonNetworkImage(
                          imageUrl:
                              "http://static.holoduke.nl/footapi/images/playerimages/${player?.id ?? ''}.png",
                          height: 50.w,
                          width: 50.w,
                          borderRadius: 25.w,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      );
    });
  }
}
