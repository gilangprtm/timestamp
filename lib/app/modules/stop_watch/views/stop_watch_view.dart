import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/stop_watch_controller.dart';

class StopWatchView extends GetView<StopWatchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                '01:10:20',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
