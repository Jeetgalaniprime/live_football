import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/common/common_appbar.dart';
import 'package:football_live/models/point_table_model.dart';
import 'package:football_live/service/mobile_ads/ad_helper.dart';
import 'package:football_live/utils/app_colors.dart';

class PointTableScreen extends StatefulWidget {
  const PointTableScreen({super.key});

  @override
  State<PointTableScreen> createState() => _PointTableScreenState();
}

class _PointTableScreenState extends State<PointTableScreen> {
  final List<PointTableModel> pointTableList = [
    PointTableModel(rank: "1", teamName: "Man City", won: "28", points: "89"),
    PointTableModel(rank: "2", teamName: "Arsenal", won: "26", points: "84"),
    PointTableModel(rank: "3", teamName: "Man Utd", won: "23", points: "75"),
    PointTableModel(rank: "4", teamName: "Newcastle", won: "19", points: "71"),
    PointTableModel(rank: "5", teamName: "Liverpool", won: "19", points: "67"),
    PointTableModel(rank: "6", teamName: "Brighton", won: "18", points: "62"),
    PointTableModel(
      rank: "7",
      teamName: "Aston Villa",
      won: "18",
      points: "61",
    ),
    PointTableModel(rank: "8", teamName: "Spurs", won: "18", points: "60"),
    PointTableModel(rank: "9", teamName: "Brentford", won: "15", points: "59"),
    PointTableModel(rank: "10", teamName: "Fulham", won: "15", points: "52"),
    PointTableModel(rank: "11", teamName: "C Palace", won: "11", points: "45"),
    PointTableModel(rank: "12", teamName: "Chelsea", won: "11", points: "44"),
    PointTableModel(rank: "13", teamName: "Wolves", won: "11", points: "41"),
    PointTableModel(rank: "14", teamName: "West Ham", won: "11", points: "40"),
    PointTableModel(
      rank: "15",
      teamName: "AFC Bournemouth",
      won: "11",
      points: "39",
    ),
    PointTableModel(
      rank: "16",
      teamName: "Nottm Forest",
      won: "9",
      points: "38",
    ),
    PointTableModel(rank: "17", teamName: "Everton", won: "8", points: "36"),
    PointTableModel(rank: "18", teamName: "Leicester", won: "9", points: "34"),
    PointTableModel(rank: "19", teamName: "Leeds", won: "7", points: "31"),
    PointTableModel(
      rank: "20",
      teamName: "Southampton",
      won: "7",
      points: "25",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.bgColor,
      bottomNavigationBar: adManager.showNativeAdsAd(AdType.nativeBig),
      appBar: CommonAppBar(title: 'Point Table'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 10.h),
          child: Column(
            children: [
              Container(
                height: 70.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          'Rank',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80.w,
                        child: Text(
                          'Team',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          'WON',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60.w,
                        child: Text(
                          'POINT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  itemCount: pointTableList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 70.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 50.w,
                              child: Text(
                                pointTableList[index].rank,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 80.w,
                              child: Text(
                                pointTableList[index].teamName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50.w,
                              child: Text(
                                pointTableList[index].won,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 60.w,
                              child: Text(
                                pointTableList[index].points,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 10.h);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
