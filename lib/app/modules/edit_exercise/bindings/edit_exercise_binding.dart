import 'package:get/get.dart';

import '../controllers/edit_exercise_controller.dart';

class EditExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditExerciseController>(
      () => EditExerciseController(),
    );
  }
}
