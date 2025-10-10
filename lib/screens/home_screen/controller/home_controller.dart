import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:football_live/models/feed_model.dart';
import 'package:football_live/models/news_model.dart';
import 'package:football_live/service/api/api_ids.dart';
import 'package:football_live/service/api/api_services.dart';
import 'package:get/get.dart';

import '../../../models/league_schedule_model.dart';

class HomeScreenController extends GetxController
    with GetTickerProviderStateMixin {
  TabController? tabController;

  RxList<News> newsList = <News>[].obs;
  RxList<FeedCountry> feedList = <FeedCountry>[].obs;
  RxList<LeagueScheduleModel> leagueSchedule = <LeagueScheduleModel>[].obs;
  RxBool isLoading = false.obs;

  Future<void> fetchLeagueSchedule(String leagueKey) async {
    isLoading.value = true;

    await ApiService.getRequest(
      ApiIds.getleagueSchedule(leagueKey),
      baseUrl: ApiIds.baseUrl1,
      onSuccess: (data) {
        try {
          if (data is List) {
            print("✅ API call success :: got ${data.length} items");
            print("data type :: ${data.runtimeType}");

            // Clear old list before adding new data
            leagueSchedule.clear();

            for (var item in data) {
              if (item is Map<String, dynamic>) {
                leagueSchedule.add(LeagueScheduleModel.fromJson(item));
              } else if (item is Map) {
                // convert dynamic map to Map<String, dynamic>
                leagueSchedule.add(
                  LeagueScheduleModel.fromJson(Map<String, dynamic>.from(item)),
                );
              }
            }

            print("✅ Parsed ${leagueSchedule.length} league schedules");
            print(
              "✅ Parsed ${leagueSchedule.first.localteam} league schedules",
            );
          } else {
            debugPrint('⚠️ Expected list, got: ${data.runtimeType}');
            leagueSchedule.clear();
          }
        } catch (e, stack) {
          debugPrint("❌ Error parsing league schedule: $e\n$stack");
          leagueSchedule.clear();
        } finally {
          isLoading.value = false;
        }
      },
      onFail: (error) {
        isLoading.value = false;
        debugPrint('❌ API Error: $error');
      },
    );
  }

  void getNews() async {
    isLoading.value = true;
    await ApiService.getRequest(
      ApiIds.getNews,
      baseUrl: ApiIds.baseUrl,
      onSuccess: (data) {
        try {
          newsList.value = NewsModel.fromJson(data).items;
          isLoading.value = false;
        } catch (e) {
          isLoading.value = false;
          debugPrint('Error: $e');
        }
      },
      onFail: (error) {
        isLoading.value = false;
      },
    );
  }

  void getFeed() async {
    isLoading.value = true;
    await ApiService.getRequest(
      ApiIds.getFeed,
      baseUrl: ApiIds.baseUrl1,
      onSuccess: (data) {
        try {
          feedList.value = FeedModel.fromJson(data).countries;
          replaceCountry(0, "Eurocups");
          replaceCountry(1, "World Cup");
          replaceCountry(2, "World Cup Qualifications");
          replaceCountry(3, "Spain");
          replaceCountry(4, "England");
          replaceCountry(5, "Germany");
          replaceCountry(6, "Italy");
          replaceCountry(7, "France");
          isLoading.value = false;
        } catch (e, st) {
          isLoading.value = false;
          debugPrint('Error: $e, $st');
        }
      },
      onFail: (error) {
        isLoading.value = false;
      },
    );
  }

  void replaceCountry(int index, String countryName) {
    final i2 = feedList.indexWhere((element) => element.country == countryName);
    if (i2 != -1) {
      feedList.insert(index, feedList[i2]);
      feedList.removeAt(i2 >= index ? i2 + 1 : i2);
    }
  }

  @override
  void onInit() {
    getFeed();
    getNews();
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }
}
