import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timestamp/app/utils/theme/app_color.dart';

class TimerController extends GetxController {
  RxBool isCount = false.obs;
  Timer? timer;
  RxInt theTime = 5.obs;

  void countDown() {
    if (theTime != 0) {
      isCount.value = true;
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          theTime.value--;
          if (theTime == 0) {
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
      }),
    ));
  }
}
