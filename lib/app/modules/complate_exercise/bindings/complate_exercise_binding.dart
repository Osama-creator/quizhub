import 'package:get/get.dart';

import '../controllers/complate_exercise_controller.dart';

class ComplateExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComplateExerciseController>(
      () => ComplateExerciseController(),
    );
  }
}
