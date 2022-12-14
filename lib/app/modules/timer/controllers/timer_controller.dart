import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timestamp/app/utils/theme/app_color.dart';

class TimerController extends GetxController {
  RxBool isCount = false.obs;
  Timer? timer;
  RxInt theTime = 5.obs;
  Rx<DateTime> duration = DateTime(DateTime.now().year).obs;

  @override
  void onInit() {
    super.onInit();
  }

  void countDown() {
    if (theTime != 0) {
      isCount.value = true;
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          duration.value = duration.value.subtract(Duration(seconds: 1));
          theTime--;
          print(theTime.value);
          if (theTime.value == 0) {
            timer.cancel();
            isCount.value = false;
          }
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
    isCount.value = false;
    theTime.value = 0;
  }

  void changeTime() {
    Get.bottomSheet(Container(
      height: 300,
      color: AppColor.white,
      child: CupertinoTimerPicker(onTimerDurationChanged: (time) {
        theTime.value = time.inSeconds;
        var hours = time.inHours;
        var min = time.inMinutes;
        var sec = time.inSeconds;
        duration.value = DateTime(2017, 9, 7, hours - hours, min - min, sec);
      }),
    ));
  }
}
