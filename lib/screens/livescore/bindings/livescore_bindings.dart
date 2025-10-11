import 'package:get/get.dart';
import '../controller/livescore_controller.dart';

class LivescoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LivescoreController>(() => LivescoreController());
  }
}