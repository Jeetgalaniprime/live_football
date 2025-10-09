import 'package:flutter/material.dart';
import 'package:football_live/models/feed_model.dart';
import 'package:football_live/models/news_model.dart';
import 'package:football_live/service/api/api_ids.dart';
import 'package:football_live/service/api/api_services.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxList<News> newsList = <News>[].obs;
  RxList<FeedCountry> feedList = <FeedCountry>[].obs;
  RxBool isLoading = false.obs;

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
          feedList.insert(0, FeedCountry(country: "Eurocups"));
          feedList.insert(1, FeedCountry(country: "World Cup"));
          feedList.insert(2, FeedCountry(country: "World Cup Qualifications"));
          feedList.insert(3, FeedCountry(country: "Spain"));
          feedList.insert(4, FeedCountry(country: "England"));
          feedList.insert(5, FeedCountry(country: "Germany"));
          feedList.insert(6, FeedCountry(country: "Italy"));
          feedList.insert(7, FeedCountry(country: "France"));
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

  @override
  void onInit() {
    getFeed();
    getNews();
    super.onInit();
  }
}
