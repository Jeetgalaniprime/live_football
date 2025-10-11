import 'package:flutter/material.dart';
import 'package:football_live/common/common_image.dart';
import 'package:football_live/common/common_loader.dart';
import 'package:football_live/models/team_details_model.dart';
import 'package:football_live/screens/home_screen/controller/home_controller.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeamInfoWidget extends GetView<HomeScreenController> {
  const TeamInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final team = controller.teamDetails.value;
      final List<Fixture> schedule = team?.fixtures ?? [];

      if (controller.isLoading.value) {
        return CommonLoader();
      }
      if (team == null) {
        return const Center(child: Text('No team data'));
      }

      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Large logo and Info row
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 16.w),
                    CommonNetworkImage(
                      imageUrl:
                          'http://static.holoduke.nl/footapi/images/teams_gs/${team.idGs}_small.png',
                      height: 100.w,
                      width: 100.w,
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Founded: ${team.founded ?? '-'}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            'Coach: ${team.coach ?? '-'}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            'Country: ${team.country ?? '-'}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            'City: ${team.city ?? '-'}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'COMPETITION',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
              // Competition Cards
              Column(
                children: (team.leagues).map<Widget>((league) {
                  return Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 4.h,
                      horizontal: 16.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: ListTile(
                      leading: CommonNetworkImage(
                        imageUrl:
                            'http://static.holoduke.nl/footapi/images/flags/${(league.country ?? '').replaceAll(' ', '-').toLowerCase()}.png',
                        height: 32.w,
                        width: 32.w,
                        borderRadius: 20,
                      ),

                      title: Text(league.league ?? ''),
                      subtitle: league.position != null
                          ? Text(
                              '${league.country ?? ''} - Position: ${league.position ?? ''}',
                            )
                          : null,
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 16.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'SCHEDULE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
              Column(
                children: schedule.map((match) {
                  return Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 12.w,
                    ),
                    color: AppColors.whiteColor.withValues(alpha: 0.8),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 20.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${match.date ?? "-"} - ${match.leaguename ?? "-"}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  match.localteam ?? '-',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ),
                              ClipOval(
                                child: Image.network(
                                  'http://static.holoduke.nl/footapi/images/teams_gs/${match.id}_small.png',
                                  width: 38,
                                  height: 38,
                                  errorBuilder: (_, __, ___) =>
                                      Icon(Icons.sports_soccer),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  match.scoretime ?? '-', // <-- Scores here!
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ClipOval(
                                child: Image.network(
                                  'http://static.holoduke.nl/footapi/images/teams_gs/${match.visitorteamid}_small.png',
                                  width: 38,
                                  height: 38,
                                  errorBuilder: (_, __, ___) =>
                                      Icon(Icons.sports_soccer),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  match.visitorteam ?? '-',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
