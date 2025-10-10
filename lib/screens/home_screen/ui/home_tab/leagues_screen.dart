// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:football_live/common/common_appbar.dart';
// import 'package:football_live/common/common_image.dart';
// import 'package:football_live/screens/home_screen/controller/home_controller.dart';
// import 'package:football_live/utils/app_colors.dart';
// import 'package:get/get.dart';

// import '../../../../routes/app_routes.dart';

// class LeaguesScreen extends GetView<HomeScreenController> {
//   const LeaguesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final feedIndex = Get.arguments['index'] ?? 0;
//     return Scaffold(
//       backgroundColor: AppColors.bgColor,
//       appBar: CommonAppBar(title: controller.feedList[feedIndex].country ?? ''),
//       body: controller.feedList[feedIndex].leagues.isNotEmpty
//           ? ListView.separated(
//               padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
//               itemBuilder: (context, index) {
//                 final item = controller.feedList[feedIndex].leagues[index];
//                 return GestureDetector(
//                   onTap: () {
//                     print("item :: ${item.toJson()}");
//                     Get.toNamed(
//                       AppRoutes.scheduleStandingScreen,
//                       arguments: {"league_key": item.key},
//                     );
//                   },
//                   child: Container(
//                     height: 100.h,
//                     decoration: BoxDecoration(
//                       color: AppColors.whiteColor,
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppColors.greyColor.withValues(alpha: 0.5),
//                           spreadRadius: 2,
//                           blurRadius: 5,
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: double.maxFinite,
//                           width: 120.w,
//                           decoration: BoxDecoration(
//                             color: AppColors.greyColor.withValues(alpha: 0.2),
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               bottomLeft: Radius.circular(10),
//                             ),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 20.w,
//                               vertical: 15.h,
//                             ),
//                             child: CommonNetworkImage(
//                               imageUrl:
//                                   'https://static.holoduke.nl/footapi/images/flags/${(controller.feedList[feedIndex].country ?? '').replaceAll(' ', '-').toLowerCase()}.png',
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 10.w),
//                         Expanded(
//                           child: Text(
//                             item.leagueName ?? '',
//                             style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return SizedBox(height: 20.h);
//               },
//               itemCount: controller.feedList[feedIndex].leagues.length,
//             )
//           : Center(
//               child: Text(
//                 'No leagues found',
//                 style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
//               ),
//             ),
//     );
//   }
// }
