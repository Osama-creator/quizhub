import 'package:get/get.dart';

import '../controllers/students_envit_controller.dart';

class StudentsEnvitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentsEnvitController>(
      () => StudentsEnvitController(),
    );
  }
}
