import 'package:get/get.dart';

import '../controllers/teachers_profiles_list_controller.dart';

class TeachersProfilesListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeachersProfilesListController>(
      () => TeachersProfilesListController(),
    );
  }
}
