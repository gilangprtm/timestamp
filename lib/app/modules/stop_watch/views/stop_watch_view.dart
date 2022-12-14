import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:timestamp/app/utils/extension/box_extension.dart';

import '../../../utils/theme/theme.dart';
import '../controllers/stop_watch_controller.dart';

class StopWatchView extends GetView<StopWatchController> {
  final StopWatchController c = Get.put(StopWatchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Obx(() {
              return Text(
                "${c.duration.value.hour} : ${c.duration.value.minute} : ${c.duration.value.second}",
                style: AppFont.h1,
              );
            }),
          ),
          40.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Icon(
                  Icons.stop,
                  size: 30,
                ),
                onPressed: () {
                  c.countStop();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: const CircleBorder(),
                ),
              ),
              15.widthBox,
              ElevatedButton(
                child: Obx(() {
                  return Icon(
                    c.isCount.value == false ? Icons.play_arrow : Icons.pause,
                    size: 30,
                  );
                }),
                onPressed: () {
                  if (c.isCount.value == false) {
                    c.countStart();
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
                  Icons.flag_rounded,
                  size: 30,
                ),
                onPressed: () {
                  c.countLap();
                },
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
