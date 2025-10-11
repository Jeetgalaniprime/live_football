import 'package:flutter/material.dart';
import 'package:football_live/common/common_common_match_box.dart';
import 'package:football_live/routes/app_routes.dart';
import 'package:get/get.dart';
import '../controller/livescore_controller.dart';

class LivescoreView extends GetView<LivescoreController> {
  const LivescoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(() {
            // print(
            // "controller.livescoreList.first.leagues.length: ${controller.livescoreList.first.leagues.length}",
            // );
            return controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.livescoreList.length,
                    itemBuilder: (context, index) {
                      final country = controller.livescoreList[index];
                      print(
                        "country: ${controller.livescoreList.first.toJson()}",
                      );
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: country.leagues?.length ?? 0,
                        itemBuilder: (context, index) {
                          final match = country.leagues?[index];
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.matchDetailsScreen,
                                arguments: match?.matches?[0].toJson(),
                              );
                            },
                            child: CommonMatchBox(
                              score: match?.matches?[0].scoretime ?? '',
                              status: match?.matches?[0].status ?? '',
                              team1ImageUrl:
                                  "https://static.holoduke.nl/footapi/images/teams_gs/${match?.matches?[0].gsLocalteamid}_small.png",
                              team2ImageUrl:
                                  "https://static.holoduke.nl/footapi/images/teams_gs/${match?.matches?[0].gsVisitorteamid}_small.png",
                              team1Name: match?.matches?[0].localteam ?? '',
                              team2Name: match?.matches?[0].visitorteam ?? '',
                              title: match?.league ?? '',
                            ).paddingSymmetric(horizontal: 10, vertical: 10),
                          );
                        },
                      );
                    },
                  );
          }),
        ],
      ),
    );
  }
}
