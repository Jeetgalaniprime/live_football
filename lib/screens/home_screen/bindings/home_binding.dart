import 'package:football_live/screens/livescore/controller/livescore_controller.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => LivescoreController());
  }
}
