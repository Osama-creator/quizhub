import 'package:get/get.dart';

import '../controllers/create_matching_exercise_controller.dart';

class CreateMatchingExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateMatchingExerciseController>(
      () => CreateMatchingExerciseController(),
    );
  }
}
