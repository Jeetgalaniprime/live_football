import 'package:flutter/material.dart';
import 'package:football_live/service/api/api_ids.dart';
import 'package:football_live/service/api/api_services.dart';
import 'package:get/get.dart';

import '../../../models/match_detailes_model.dart';

class MatchDetailesController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  final RxBool isLoading = false.obs;

  Rx<MatchDetailsModel> matchDetailesData = MatchDetailsModel().obs;

  Future<void> fetchMatchDetails(String matchId) async {
    isLoading.value = true;

    ApiService.getRequest(
      ApiIds.getMatchDetails(matchId),
      baseUrl: ApiIds.baseUrl2,
      onSuccess: (data) {
        isLoading.value = false;
        try {
          matchDetailesData.value = MatchDetailsModel.fromJson(data);
        } catch (e) {
          debugPrint(e.toString());
        }
      },
      onFail: (error) {
        debugPrint(error);
        isLoading.value = false;
      },
    );
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }
}
