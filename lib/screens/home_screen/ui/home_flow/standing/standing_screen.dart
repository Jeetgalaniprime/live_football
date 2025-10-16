import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/common/common_image.dart';
import 'package:football_live/routes/app_routes.dart';
import 'package:football_live/screens/home_screen/controller/home_controller.dart';
import 'package:football_live/service/mobile_ads/ad_helper.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:get/get.dart';

class StandingScreen extends StatefulWidget {
  const StandingScreen({super.key});

  @override
  State<StandingScreen> createState() => StandingScreenState();
}

class StandingScreenState extends State<StandingScreen> {
  final controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      final standing = controller.standing.value;
      final group = standing?.groups.isNotEmpty == true
          ? standing?.groups.first
          : null;
      if (group == null) {
        return const Center(child: Text("No standings available"));
      }

      return ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          Table(
            columnWidths: const {
              0: FixedColumnWidth(40),
              1: FlexColumnWidth(3),
              2: FixedColumnWidth(28),
              3: FixedColumnWidth(28),
              4: FixedColumnWidth(28),
              5: FixedColumnWidth(28),
              6: FixedColumnWidth(34),
              7: FixedColumnWidth(34),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                decoration: const BoxDecoration(color: AppColors.primaryColor),
                children: [
                  const SizedBox(),
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      'Team',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                    child: Text(
                      'GP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                    child: Text(
                      'W',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                    child: Text(
                      'D',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                    child: Text(
                      'L',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                    child: Text(
                      'GD',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                    child: Text(
                      'Pts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
              // Data rows: single-cell InkWell rows for tap support
              ...group.teams.map(
                (team) => TableRow(
                  decoration: BoxDecoration(
                    // color: AppColors.whiteColor,
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.greyColor.withValues(alpha: 0.8),
                      ),
                    ),
                  ),
                  children: [
                    InkWell(
                      onTap: () {
                        AdHelper().showInterstitialAdOnClickEvent(() {
                          Get.toNamed(
                            AppRoutes.teamDetailsScreen,
                            arguments: team.idGs,
                          );
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.h,
                          vertical: 10.h,
                        ),
                        child: CommonNetworkImage(
                          imageUrl:
                              'http://static.holoduke.nl/footapi/images/teams_gs/${team.idGs}_small.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: _sizedStatCell(
                        value: team.team ?? '',
                        teamIdGs: team.idGs,
                        width: 50.w,
                        alignment: TextAlign.left,
                      ),
                    ),
                    Center(
                      child: _sizedStatCell(
                        value: team.matchPoints,
                        teamIdGs: team.idGs,
                      ),
                    ),
                    Center(
                      child: _sizedStatCell(
                        value: team.totalWon,
                        teamIdGs: team.idGs,
                      ),
                    ),
                    Center(
                      child: _sizedStatCell(
                        value: team.totalDraw,
                        teamIdGs: team.idGs,
                      ),
                    ),
                    Center(
                      child: _sizedStatCell(
                        value: team.totalLost,
                        teamIdGs: team.idGs,
                      ),
                    ),
                    Center(
                      child: _sizedStatCell(
                        value: team.goalDifference,
                        teamIdGs: team.idGs,
                      ),
                    ),
                    Center(child: _sizedStatCell(value: team.points)),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget _sizedStatCell({
    String? value,
    double? width,
    TextAlign? alignment,
    String? teamIdGs,
  }) => InkWell(
    onTap: () {
      AdHelper().showInterstitialAdOnClickEvent(() {
        Get.toNamed(AppRoutes.teamDetailsScreen, arguments: teamIdGs);
      });
    },
    child: SizedBox(
      width: (width ?? 20).w,
      child: Text(
        value ?? '0',
        textAlign: alignment ?? TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor.withValues(alpha: 0.8),
        ),
      ),
    ),
  );
}
