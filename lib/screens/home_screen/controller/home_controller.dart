import 'package:flutter/material.dart';
import 'package:football_live/models/feed_model.dart';
import 'package:football_live/models/news_model.dart';
import 'package:football_live/models/player_model.dart';
import 'package:football_live/models/standing_model.dart';
import 'package:football_live/models/team_details_model.dart';
import 'package:football_live/service/api/api_ids.dart';
import 'package:football_live/service/api/api_services.dart';
import 'package:get/get.dart';
import '../../../models/league_schedule_model.dart';

class HomeScreenController extends GetxController
    with GetTickerProviderStateMixin {
  RxList<News> newsList = <News>[].obs;
  RxList<FeedCountry> feedList = <FeedCountry>[].obs;
  RxList<LeagueScheduleModel> leagueSchedule = <LeagueScheduleModel>[].obs;
  RxBool isLoading = false.obs;
  Rxn<StandingModel> standing = Rxn<StandingModel>();
  Rxn<TeamDetailsModel> teamDetails = Rxn<TeamDetailsModel>();
  Rxn<PlayerModel> player = Rxn<PlayerModel>();

  Future<void> fetchLeagueSchedule(String leagueKey) async {
    isLoading.value = true;

    await ApiService.getRequest(
      ApiIds.getleagueSchedule(leagueKey),
      baseUrl: ApiIds.baseUrl1,
      onSuccess: (data) {
        try {
          if (data is List) {
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

  void getStanding(int league, int index) async {
    isLoading.value = true;
    await ApiService.getRequest(
      ApiIds.getStanding(feedList[index].leagues[league].key ?? ''),
      baseUrl: ApiIds.baseUrl,
      onSuccess: (data) {
        try {
          // debugPrint('standing: $data');
          standing.value = StandingModel.fromJson(data);
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

  void getTeamDetails(String teamIdGs) async {
    isLoading.value = true;
    await ApiService.getRequest(
      ApiIds.getTeamDetails('7079'),
      baseUrl: ApiIds.baseUrl,
      onSuccess: (data) {
        try {
          debugPrint('teamDetails: $data');
          teamDetails.value = TeamDetailsModel.fromJson(data);
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

  void getPlayer(String playerId) async {
    isLoading.value = true;
    await ApiService.getRequest(
      ApiIds.getPlayer(playerId),
      baseUrl: ApiIds.baseUrl,
      onSuccess: (data) {
        try {
          debugPrint('player: $data');
          player.value = PlayerModel.fromJson(data);
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

  @override
  void onInit() {
    getFeed();
    getNews();
    super.onInit();
  }
}
