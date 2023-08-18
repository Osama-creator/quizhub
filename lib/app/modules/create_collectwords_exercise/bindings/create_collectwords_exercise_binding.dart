import 'package:get/get.dart';

import '../controllers/create_collectwords_exercise_controller.dart';

class CreateCollectwordsExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateCollectwordsExerciseController>(
      () => CreateCollectwordsExerciseController(),
    );
  }
}
