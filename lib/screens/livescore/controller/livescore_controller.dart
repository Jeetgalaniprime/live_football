import 'package:flutter/material.dart';
import 'package:football_live/models/live_score_model.dart';
import 'package:football_live/service/api/api_ids.dart';
import 'package:football_live/service/api/api_services.dart';
import 'package:get/get.dart';

class LivescoreController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<LiveScoreModel> livescoreList = <LiveScoreModel>[].obs;

  Future<void> fetchLivescore() async {
    isLoading.value = true;
    try {
      ApiService.getRequest(
        ApiIds.getLivenow,
        baseUrl: ApiIds.baseUrl1,
        onSuccess: (data) {
          if (data is List) {
            livescoreList.clear();

            for (var item in data) {
              if (item is Map<String, dynamic>) {
                print("this is call : 00");
                try {
                  livescoreList.add(LiveScoreModel.fromJson(item));
                } catch (e, t) {
                  debugPrint('Error parsing LiveScoreModel: $e');
                  debugPrint('Trace: $t');
                }
              } else if (item is Map) {
                print("this is call : 11");
                // convert dynamic map to Map<String, dynamic>
                livescoreList.add(
                  LiveScoreModel.fromJson(Map<String, dynamic>.from(item)),
                );
              }
            }
          } else {
            debugPrint('⚠️ Expected list, got: ${data.runtimeType}');
            livescoreList.clear();
          }
          print("livescoreList: ${livescoreList.length}");
          // debugPrint(livescoreList.toString());
          isLoading.value = false;
        },
        onFail: (error) {
          debugPrint(error);
          isLoading.value = false;
        },
      );
    } catch (e, t) {
      debugPrint(e.toString());
      debugPrint(t.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchLivescore();
    super.onInit();
  }
}
