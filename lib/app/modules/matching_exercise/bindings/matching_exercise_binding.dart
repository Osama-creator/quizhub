import 'package:get/get.dart';

import '../controllers/matching_exercise_controller.dart';

class MatchingExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatchingExerciseController>(
      () => MatchingExerciseController(),
    );
  }
}
