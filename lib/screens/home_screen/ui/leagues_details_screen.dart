import 'package:flutter/material.dart';
import 'package:football_live/common/common_appbar.dart';
import 'package:football_live/screens/home_screen/controller/home_controller.dart';
import 'package:football_live/screens/home_screen/ui/standing_screen.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:get/get.dart';

class LeaguesDetailsScreen extends StatefulWidget {
  const LeaguesDetailsScreen({super.key});

  @override
  State<LeaguesDetailsScreen> createState() => _LeaguesDetailsScreenState();
}

class _LeaguesDetailsScreenState extends State<LeaguesDetailsScreen> {
  final controller = Get.find<HomeScreenController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getStanding(
        Get.arguments['index'],
        Get.arguments['leagueIndex'],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: CommonAppBar(
          title: 'League Details',
          showBackButton: true,
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          bottom: TabBar(
            indicatorColor: AppColors.primaryColor,
            labelColor: AppColors.blackColor,
            unselectedLabelColor: AppColors.greyColor,
            tabs: const [
              Tab(text: 'Schedule'),
              Tab(text: 'Standing'),
            ],
          ),
        ),
        body: TabBarView(
          children: const [
            Center(child: Text('Schedule Content')),
            StandingScreen(),
          ],
        ),
      ),
    );
  }
}
