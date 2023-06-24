import 'package:get/get.dart';
import 'package:quizhub/app/models/exams_card.dart';
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
}
