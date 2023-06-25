import 'package:get/get.dart';
import 'package:quizhub/app/models/exersice.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/app/services/exams.dart';

import '../../../models/exams_card.dart';

class StudentExercisesListController extends GetxController {
  final Map<String, dynamic> args = Get.arguments as Map<String, dynamic>;
  final service = Get.find<ExamsService>();
  List<String> teachers = [];
  String selectedTeacher = '';
  Map<String, List<ExerciseModel>> subjectExams = {};

  @override
  Future<void> onInit() async {
    super.onInit();

    await fetchData();
  }

  Future<void> fetchData() async {
    try {
      final teachersFromApi = await service.fetchTeacherNames(
        "6495d071a13af5b54e73ab3f",
        args['subject'] as String,
      );
      final exercisesFromApi = await service.fetchStudentExams(
        // userId: args['userId'] as String,
        "6495d071a13af5b54e73ab3f",
        args['subject'] as String,
      );
      subjectExams = exercisesFromApi;
      teachers = teachersFromApi;
      selectedTeacher = teachers[0];
      update();
    } catch (e) {
      // Handle the error
    }
  }

  void onSelect(int index) {
    final teacher = teachers[index];
    selectedTeacher = teacher;
    update();
  }

  void goToExamPage(int i, ExerciseCardModel exercise) {
    final selectedExam = exercise.exercises[i].type;
    final exmaId = exercise.exercises[i].id;

    switch (selectedExam) {
      case "choose":
        Get.toNamed(Routes.MCQ_EXERCISE, arguments: exmaId);
        break;
      case "true_false":
        Get.toNamed(Routes.TRUE_FALSE_EXERCISE, arguments: exmaId);
        break;
      case "fill_gabs":
        Get.toNamed(Routes.COMPLATE_EXERCISE, arguments: exmaId);
        break;
      case "matching":
        Get.toNamed(Routes.MATCHING_EXERCISE, arguments: exmaId);
        break;
    }
  }
}
