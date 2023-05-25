import 'package:get/get.dart';

import '../controllers/create_choose_exercise_controller.dart';

class CreateChooseExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateChooseExerciseController>(
      () => CreateChooseExerciseController(),
    );
  }
}
