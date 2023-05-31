import 'package:get/get.dart';

import '../controllers/student_exercises_list_controller.dart';

class StudentExercisesListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentExercisesListController>(
      () => StudentExercisesListController(),
    );
  }
}
