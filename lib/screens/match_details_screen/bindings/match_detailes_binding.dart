import 'package:football_live/screens/match_details_screen/controller/match_detailes_controller.dart';
import 'package:get/get.dart';

class MatchDetailesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MatchDetailesController());
  }
}
