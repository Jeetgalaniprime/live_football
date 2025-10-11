import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/common/common_appbar.dart';
import 'package:football_live/models/point_table_model.dart';
import 'package:football_live/utils/app_assets.dart';
import 'package:football_live/utils/app_colors.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  final List<PointTableModel> pointTableList = [
    PointTableModel(
      rank: "1",
      teamName: AppAssets.rankingFlagArgentinaImage,
      won: "Argentina",
      points: "1840.93",
    ),
    PointTableModel(
      rank: "2",
      teamName: AppAssets.rankingFlagFranceImage,
      won: "France",
      points: "1838.45",
    ),
    PointTableModel(
      rank: "3",
      teamName: AppAssets.rankingFlagBrazilImage,
      won: "Brazil",
      points: "1834.21",
    ),
    PointTableModel(
      rank: "4",
      teamName: AppAssets.rankingFlagBelgiumImage,
      won: "Belgium",
      points: "1792.53",
    ),
    PointTableModel(
      rank: "5",
      teamName: AppAssets.rankingFlagEnglandImage,
      won: "England",
      points: "1792.43",
    ),
    PointTableModel(
      rank: "6",
      teamName: AppAssets.rankingFlagNetherlandsImage,
      won: "Netherlands",
      points: "1721.23",
    ),
    PointTableModel(
      rank: "7",
      teamName: AppAssets.rankingFlagCroatiaImage,
      won: "Croatia",
      points: "1730.02",
    ),
    PointTableModel(
      rank: "8",
      teamName: AppAssets.rankingFlagItalyImage,
      won: "Italy",
      points: "1713.66",
    ),
    PointTableModel(
      rank: "9",
      teamName: AppAssets.rankingFlagPortugalImage,
      won: "Portugal",
      points: "1707.22",
    ),
    PointTableModel(
      rank: "10",
      teamName: AppAssets.rankingFlagSpainImage,
      won: "Spain",
      points: "1682.85",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CommonAppBar(title: 'Ranking'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 10.h),
          child: Column(
            children: [
              Container(
                height: 70.h,
                decoration: BoxDecoration(color: AppColors.primaryColor),
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
                      decoration: BoxDecoration(color: AppColors.primaryColor),
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
                              height: 40.h,
                              child: Image.asset(pointTableList[index].teamName,fit: BoxFit.fitHeight,),
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
