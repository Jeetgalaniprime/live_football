import 'package:flutter/material.dart';
import 'package:football_live/common/common_appbar.dart';
import 'package:football_live/common/common_loader.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class TeamDetailsScreen extends StatefulWidget {
  const TeamDetailsScreen({super.key});

  @override
  State<TeamDetailsScreen> createState() => _TeamDetailsScreenState();
}

class _TeamDetailsScreenState extends State<TeamDetailsScreen> {
  final controller = Get.find<HomeScreenController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getTeamDetails(Get.arguments);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? CommonLoader()
          : DefaultTabController(
              length: 3,
              child: Scaffold(
                backgroundColor: AppColors.bgColor,
                appBar: CommonAppBar(
                  title: 'Team Details',
                  showBackButton: true,
                  backgroundColor: AppColors.primaryColor,
                  elevation: 0,
                  bottom: TabBar(
                    indicatorColor: AppColors.primaryColor,
                    labelColor: AppColors.blackColor,
                    unselectedLabelColor: AppColors.greyColor,
                    tabs: const [
                      Tab(text: 'Team Info'),
                      Tab(text: 'Squad'),
                      Tab(text: 'Transfer'),
                    ],
                  ),
                ),
                body: const TabBarView(
                  children: [
                    Center(child: Text('Team Info Content')),
                    Center(child: Text('Squad Content')),
                    Center(child: Text('Transfer Content')),
                  ],
                ),
              ),
            ),
    );
  }
}
