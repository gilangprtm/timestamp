import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timestamp/app/utils/services_init.dart';

import 'app/routes/app_pages.dart';

void main() {
  ProjectService.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
    ),
  );
}
