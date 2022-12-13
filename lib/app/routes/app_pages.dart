import 'package:get/get.dart';

import 'package:timestamp/app/modules/home/bindings/home_binding.dart';
import 'package:timestamp/app/modules/home/views/home_view.dart';
import 'package:timestamp/app/modules/stop_watch/bindings/stop_watch_binding.dart';
import 'package:timestamp/app/modules/stop_watch/views/stop_watch_view.dart';
import 'package:timestamp/app/modules/timer/bindings/timer_binding.dart';
import 'package:timestamp/app/modules/timer/views/timer_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TIMER,
      page: () => TimerView(),
      binding: TimerBinding(),
    ),
    GetPage(
      name: _Paths.STOP_WATCH,
      page: () => StopWatchView(),
      binding: StopWatchBinding(),
    ),
  ];
}
