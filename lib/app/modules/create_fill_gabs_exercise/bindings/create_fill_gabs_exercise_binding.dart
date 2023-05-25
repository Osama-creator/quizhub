import 'package:get/get.dart';

import '../controllers/create_fill_gabs_exercise_controller.dart';

class CreateFillGabsExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateFillGabsExerciseController>(
      () => CreateFillGabsExerciseController(),
    );
  }
}
