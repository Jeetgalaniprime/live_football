import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/common/common_image.dart';
import 'package:football_live/routes/app_routes.dart';
import 'package:football_live/screens/home_screen/controller/home_controller.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:get/get.dart';

class SquardWidget extends GetView<HomeScreenController> {
  const SquardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      itemCount: controller.teamDetails.value?.squad.length ?? 0,
      itemBuilder: (context, index) {
        final player = controller.teamDetails.value?.squad[index];
        return InkWell(
          onTap: () {
            Get.toNamed(  
              AppRoutes.playerDetailsScreen,
              arguments: player?.id,
            );
          },
          child: Card(
            elevation: 2,
            color: AppColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CommonNetworkImage(
                imageUrl:
                    'http://static.holoduke.nl/footapi/images/playerimages/${player?.id}.png',
                height: 50.w,
                width: 50.w,
              ),
              title: Text(
                player?.name ?? '',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                player?.position == 'G'
                    ? 'Goalkeeper'
                    : player?.position == 'D'
                    ? 'Defender'
                    : player?.position == 'M'
                    ? 'Midfielder'
                    : player?.position == 'A'
                    ? 'Attacker'
                    : player?.position ?? '',
                style: TextStyle(
                  color: AppColors.blackColor.withValues(alpha: 0.8),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
