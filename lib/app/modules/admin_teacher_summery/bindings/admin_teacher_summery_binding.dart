import 'package:get/get.dart';

import '../controllers/admin_teacher_summery_controller.dart';

class AdminTeacherSummeryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminTeacherSummeryController>(
      () => AdminTeacherSummeryController(),
    );
  }
}
