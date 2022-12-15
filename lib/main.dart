import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timestamp/app/utils/services_init.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/theme/theme.dart';

void main() {
  ProjectService.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Timer Watch",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
    ),
  );
}
