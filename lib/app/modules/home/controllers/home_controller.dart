import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timestamp/app/modules/stop_watch/views/stop_watch_view.dart';
import 'package:timestamp/app/modules/timer/views/timer_view.dart';

class HomeController extends GetxController {
  RxInt index = 0.obs;
  List fragments = [
    TimerView(),
    StopWatchView(),
  ];
  List navs = [
    {
      'icon_on': Icons.watch_later,
      'icon_off': Icons.watch_later_outlined,
      'label': 'Timer',
    },
    {
      'icon_on': Icons.watch,
      'icon_off': Icons.watch_outlined,
      'label': 'Stop Watch',
    },
  ];

  @override
  void onInit() {
    super.onInit();
  }
}
