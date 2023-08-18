import 'package:get/get.dart';

import '../controllers/collectwords_exercise_controller.dart';

class CollectwordsExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CollectwordsExerciseController>(
      () => CollectwordsExerciseController(),
    );
  }
}
