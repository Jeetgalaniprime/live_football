import 'package:flutter/material.dart';
import 'package:football_live/common/common_appbar.dart';
import 'package:football_live/screens/home_screen/controller/home_controller.dart';
import 'package:football_live/screens/home_screen/ui/feed_screen.dart';
import 'package:football_live/screens/news_screen/news_screen.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: CommonAppBar(
          title: 'Live Football',
          showBackButton: false,
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          bottom: TabBar(
            indicatorColor: AppColors.primaryColor,
            labelColor: AppColors.blackColor,
            unselectedLabelColor: AppColors.greyColor,
            tabs: const [
              Tab(text: 'Home'),
              Tab(text: 'News'),
              Tab(text: 'Live Score'),
            ],
          ),
        ),
        body: TabBarView(
          children: const [
            FeedScreen(),
            NewsScreen(),
            Center(child: Text('Live Score Content')),
          ],
        ),
      ),
    );
  }
}
