import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timestamp/app/utils/extension/box_extension.dart';

import '../../../utils/theme/theme.dart';
import '../controllers/stop_watch_controller.dart';

class StopWatchView extends GetView<StopWatchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '01:10:20',
              style: AppFont.h1,
            ),
          ),
          40.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Icon(
                  Icons.play_arrow,
                  size: 30,
                ),
                onPressed: () {},
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
                onPressed: () {},
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
