import 'package:get/get.dart';

import '../controllers/students_grades_controller.dart';

class StudentsGradesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentsGradesController>(
      () => StudentsGradesController(),
    );
  }
}
