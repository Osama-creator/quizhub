import 'package:get/get.dart';

import '../controllers/teacher_summery_controller.dart';

class TeacherSummeryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherSummeryController>(
      () => TeacherSummeryController(),
    );
  }
}
