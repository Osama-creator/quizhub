import 'package:get/get.dart';

import '../controllers/true_false_exercise_controller.dart';

class TrueFalseExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrueFalseExerciseController>(
      () => TrueFalseExerciseController(),
    );
  }
}
