import 'package:get/get.dart';

import '../controllers/create_true_false_exercise_controller.dart';

class CreateTrueFalseExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateTrueFalseExerciseController>(
      () => CreateTrueFalseExerciseController(),
    );
  }
}
