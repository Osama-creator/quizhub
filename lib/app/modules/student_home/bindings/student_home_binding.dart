import 'package:get/get.dart';

import 'package:quizhub/app/modules/student_home/controllers/student_home_controller.dart';

class StudentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StudentHomeController>(
      StudentHomeController(),
    );
  }
}
