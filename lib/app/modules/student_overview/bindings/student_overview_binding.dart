import 'package:get/get.dart';

import '../controllers/student_overview_controller.dart';

class StudentOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentOverviewController>(
      () => StudentOverviewController(),
    );
  }
}
