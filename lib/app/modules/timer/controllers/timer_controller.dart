import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get.dart';
import 'package:timestamp/app/utils/extension/box_extension.dart';
import 'package:timestamp/app/utils/theme/app_color.dart';

class TimerController extends GetxController {
  RxBool isCount = false.obs;
  Timer? timer;
  RxInt theTime = 0.obs;
  Rx<DateTime> duration = DateTime(DateTime.now().year).obs;
  final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 500),
  ];

  @override
  void onInit() async {
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
          if (theTime.value == 0) {
            timer.cancel();
            isCount.value = false;
            Vibrate.vibrateWithPauses(pauses);
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
    duration.value = DateTime(
      2017,
      9,
      7,
    );
    isCount.value = false;
    theTime.value = 0;
  }

  void changeTime() {
    Get.bottomSheet(Container(
      height: 300,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 5,
              width: 100,
              decoration: BoxDecoration(
                color: AppColor.grey3,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
          15.heightBox,
          CupertinoTimerPicker(onTimerDurationChanged: (time) {
            theTime.value = time.inSeconds;
            var hours = time.inHours;
            var min = time.inMinutes;
            var sec = time.inSeconds;
            duration.value =
                DateTime(2017, 9, 7, hours - hours, min - min, sec);
          }),
        ],
      ),
    ));
  }
}
