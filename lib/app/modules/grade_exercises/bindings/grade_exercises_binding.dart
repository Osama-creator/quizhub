import 'package:get/get.dart';

import '../controllers/grade_exercises_controller.dart';

class GradeExercisesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GradeExercisesController>(
      () => GradeExercisesController(),
    );
  }
}
