import 'package:get/get.dart';
import 'package:quizhub/app/models/exersice.dart';
import 'package:quizhub/app/services/exams.dart';

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
}
