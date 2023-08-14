import 'package:get/get.dart';
import 'package:quizhub/app/modules/home/controllers/home_controller.dart';

import 'package:quizhub/app/modules/matching_exercise/controllers/matching_exercise_controller.dart';

class MatchingExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MatchingExerciseController>(MatchingExerciseController());
    Get.put<HomeController>(HomeController());
  }
}
