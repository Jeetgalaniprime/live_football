// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:football_live/common/common_image.dart';
import 'package:football_live/common/common_widget.dart';

import '../utils/app_colors.dart';

class CommonMatchBox extends StatelessWidget {
  final String? title;
  final String? team1Name;
  final String? team1ImageUrl;
  final String? team2Name;
  final String? team2ImageUrl;
  final String? score;
  final String? status;
  const CommonMatchBox({
    super.key,
    this.title,
    this.team1Name,
    this.team1ImageUrl,
    this.team2Name,
    this.team2ImageUrl,
    this.score,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: commonWidth,
      decoration: BoxDecoration(
        color: AppColors.boxColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor,
            blurRadius: 4.r,
            offset: const Offset(0, 2), // Shadow position
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 35.h,
            width: commonWidth,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: Center(
              child: Text(
                title ?? '',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
          // Spacer(),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      team1Name ?? '',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 40.w,
                    width: 40.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: CommonNetworkImage(imageUrl: team1ImageUrl ?? ''),
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    score ?? '',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(
                    width: 40.w,
                    child: Center(
                      child: Text(
                        status ?? '',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 93, 187, 76),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 40.w,
                    width: 40.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: CommonNetworkImage(imageUrl: team2ImageUrl ?? ''),
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      team2Name ?? '',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(horizontal: 20.w),

          // Spacer(),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
