import 'package:get/get.dart';

import 'package:quizhub/app/modules/students_envit/controllers/students_envit_controller.dart';

class StudentsEnvitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StudentsEnvitController>(
      StudentsEnvitController(),
    );
  }
}
