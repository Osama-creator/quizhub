import 'package:get/get.dart';

import '../controllers/admin_schools_list_controller.dart';

class AdminSchoolsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSchoolsListController>(
      () => AdminSchoolsListController(),
    );
  }
}
