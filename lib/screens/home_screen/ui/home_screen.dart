import 'package:flutter/material.dart';
import 'package:football_live/common/common_appbar.dart';
import 'package:football_live/screens/home_screen/controller/home_controller.dart';
import 'package:football_live/screens/home_screen/ui/home_flow/feed_screen.dart';
import 'package:football_live/screens/livescore/view/livescore_view.dart';
import 'package:football_live/screens/news_screen/news_screen.dart';
import 'package:football_live/service/mobile_ads/ad_helper.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.transparent,
          child: adManager.showNativeAdsAd(AdType.nativeSmall),
        ),
        // backgroundColor: AppColors.bgColor,
        appBar: CommonAppBar(
          title: 'Live Football',
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          bottom: TabBar(
            indicatorColor: AppColors.primaryColor,
            labelColor: AppColors.whiteColor,
            unselectedLabelColor: AppColors.greyColor,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: 'Home'),
              Tab(text: 'News'),
              Tab(text: 'Live Score'),
            ],
          ),
        ),
        body: TabBarView(
          children: const [FeedScreen(), NewsScreen(), LivescoreView()],
        ),
      ),
    );
  }
}
