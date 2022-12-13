import 'package:get/get.dart';

import '../controllers/stop_watch_controller.dart';

class StopWatchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StopWatchController>(
      () => StopWatchController(),
    );
  }
}
