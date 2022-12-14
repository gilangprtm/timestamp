import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:timestamp/app/utils/extension/box_extension.dart';
import 'package:timestamp/app/utils/theme/theme.dart';
import '../controllers/timer_controller.dart';

class TimerView extends GetView<TimerController> {
  final TimerController c = Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Obx(() {
              return GestureDetector(
                onTap: () => c.changeTime(),
                child: Text(
                  c.theTime == 0 ? "DONE" : c.theTime.toString(),
                  style: AppFont.h1,
                ),
              );
            }),
          ),
          40.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Obx(() {
                  return Icon(
                    c.isCount.value == false ? Icons.play_arrow : Icons.pause,
                    size: 30,
                  );
                }),
                onPressed: () {
                  if (c.isCount.value == false) {
                    c.countDown();
                  } else {
                    c.countPause();
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: const CircleBorder(),
                ),
              ),
              15.widthBox,
              ElevatedButton(
                child: Icon(
                  Icons.stop,
                  size: 30,
                ),
                onPressed: () => c.countStop(),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: const CircleBorder(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
