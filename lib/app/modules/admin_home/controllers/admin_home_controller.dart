import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(update); // Use 'this' as vsync
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void changeTab(int index) {
    tabController.animateTo(index);
    update();
  }
}
