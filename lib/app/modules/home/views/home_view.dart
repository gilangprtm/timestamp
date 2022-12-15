import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/theme/theme.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => controller.fragments[controller.index.value])),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 0,
          currentIndex: controller.index.value,
          onTap: (value) => controller.index.value = value,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColor.blue2,
          unselectedItemColor: AppColor.blue,
          items: List.generate(2, (index) {
            var nav = controller.navs[index];
            return BottomNavigationBarItem(
              icon: Icon(nav['icon_off']),
              label: nav['label'],
              activeIcon: Icon(nav['icon_on']),
            );
          }),
        ),
      ),
    );
  }
}
