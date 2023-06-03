import 'package:get/get.dart';

import '../controllers/admin_teachers_of_school_controller.dart';

class AdminTeachersOfSchoolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminTeachersOfSchoolController>(
      () => AdminTeachersOfSchoolController(),
    );
  }
}
