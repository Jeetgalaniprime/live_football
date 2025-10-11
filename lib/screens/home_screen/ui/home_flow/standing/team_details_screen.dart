import 'package:flutter/material.dart';
import 'package:football_live/common/common_appbar.dart';
import 'package:football_live/screens/home_screen/ui/home_flow/standing/squard_widget.dart';
import 'package:football_live/screens/home_screen/ui/home_flow/standing/team_info_widget.dart';
import 'package:football_live/screens/home_screen/ui/home_flow/standing/transfer_widget.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: CommonAppBar(
          title: 'Team Details',
          showBackButton: true,
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          bottom: TabBar(
            indicatorColor: AppColors.whiteColor,
            labelColor: AppColors.whiteColor,
            unselectedLabelColor: AppColors.greyColor,
            tabs: const [
              Tab(text: 'Team Info'),
              Tab(text: 'Squad'),
              Tab(text: 'Transfer'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TeamInfoWidget(),
            SquardWidget(),
            TransferWidget()
          ],
        ),
      ),
    );
  }
}
