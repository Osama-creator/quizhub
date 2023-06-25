import 'package:get/get.dart';
import 'package:quizhub/app/models/exams_card.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/app/services/exams.dart';

class StudentHomeController extends GetxController {
  final service = Get.find<ExamsService>();

  String selectedSubject = '';

  List<String> subjects = [];

  List<ExerciseCardModel> exercises = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchSubjects();
  }

  Future<void> fetchSubjects() async {
    try {
      final subjectsFromApi = await service.fetchStudentHomeSubjectNames(
        "6495d071a13af5b54e73ab3f",
      );
      subjects = subjectsFromApi;
      selectedSubject = subjects[0];
      update();
    } catch (e) {
      // Handle the error
    }
  }

  Future<void> fetchExercisesForSubject(String subjectName) async {
    try {
      final exercisesFromApi = await service.fetchStudentExercises(
        userId: "6495d071a13af5b54e73ab3f",
        subject: subjectName,
      );
      exercises = exercisesFromApi;
      update();
    } catch (e) {
      // Handle the error
    }
  }

  void onSelectSubject(int index) {
    final subject = subjects[index];
    selectedSubject = subject;
    fetchExercisesForSubject(subject);
    update();
  }

  void goToExamPage(int i, ExerciseCardModel exercise) {
    final selectedExam = exercise.exercises[i].type;
    final exmaId = exercise.exercises[i].id;

    switch (selectedExam) {
      case "choose":
        Get.toNamed(Routes.MCQ_EXERCISE, arguments: exmaId);
        print(exmaId);
        break;
      case "true_false":
        Get.toNamed(Routes.TRUE_FALSE_EXERCISE, arguments: exmaId);
        print(exmaId);
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
