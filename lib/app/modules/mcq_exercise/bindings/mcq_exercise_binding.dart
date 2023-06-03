import 'package:get/get.dart';

import 'package:quizhub/app/modules/mcq_exercise/controllers/mcq_exercise_controller.dart';

class McqExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<McqExerciseController>(
      McqExerciseController(),
    );
  }
}
