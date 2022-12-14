import 'dart:async';
import 'package:get/get.dart';

class StopWatchController extends GetxController {
  RxBool isCount = false.obs;
  Timer? timer;
  Rx<DateTime> duration = DateTime(DateTime.now().year).obs;
  RxList lap = [].obs;

  void countStart() {
    if (isCount.value == false) {
      isCount.value = true;
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          duration.value = duration.value.add(Duration(seconds: 1));
        },
      );
    }
  }

  void countPause() {
    timer!.cancel();
    isCount.value = false;
  }

  void countStop() {
    timer!.cancel();
    duration.value = DateTime(
      2017,
      9,
      7,
    );
    isCount.value = false;
  }

  void countLap() {
    if (isCount == true) {
      var time =
          "${duration.value.hour} : ${duration.value.minute} : ${duration.value.second}";
      lap.add(time);
      print(lap);
    }
  }
}
