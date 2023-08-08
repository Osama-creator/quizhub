import 'package:get/get.dart';

import 'package:quizhub/app/modules/parent_home/controllers/parent_home_controller.dart';

class ParentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ParentHomeController>(
      ParentHomeController(),
    );
  }
}
