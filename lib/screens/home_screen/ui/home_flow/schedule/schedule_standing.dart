// import 'package:flutter/material.dart';
// import 'package:football_live/common/common_appbar.dart';
// import 'package:football_live/screens/home_screen/controller/home_controller.dart';
// import 'package:football_live/screens/home_screen/ui/home_tab/schedule_screen.dart';
// import 'package:football_live/screens/home_screen/ui/home_flow/standing/standing_screen.dart';
// import 'package:football_live/utils/app_colors.dart';
// import 'package:get/get.dart';

// class ScheduleStandingScreen extends GetView<HomeScreenController> {
//   const ScheduleStandingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final leagueKey = Get.arguments['league_key'];
//     return Scaffold(
//       appBar: CommonAppBar(
//         title: "Leagues",
//         bottom: TabBar(
//           controller: controller.tabController,
//           indicatorColor: AppColors.primaryColor,
//           labelColor: AppColors.blackColor,
//           unselectedLabelColor: AppColors.greyColor,
//           tabs: const [
//             Tab(text: 'Schedule'),
//             Tab(text: 'Standing'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: controller.tabController,
//         children: [
//           GetBuilder<HomeScreenController>(
//             init: controller,
//             initState: (_) async {
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//                 controller.fetchLeagueSchedule(leagueKey);
//               });
//             },
//             builder: (_) {
//               if (controller.isLoading.value) {
//                 return const Center(child: CircularProgressIndicator());
//               } else {
//                 return ScheduleScreen();
//               }
//             },
//           ),
//           StandingScreen(),
//         ],
//       ),
//     );
//   }
// }
