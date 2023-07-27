import 'package:get/get.dart';
import 'package:quizhub/app/models/exersice.dart';
import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/app/modules/student_home/controllers/student_home_controller.dart';
import 'package:quizhub/app/services/exams.dart';

class StudentExercisesListController extends GetxController {
  final Map<String, dynamic> args = Get.arguments as Map<String, dynamic>;
  final service = Get.find<ExamsService>();
  final studentHome = Get.find<StudentHomeController>();
  List<User> teachers = [];
  User selectedTeacher = User(id: "id", name: "name");
  String subjName = '';
  Map<String, List<ExerciseModel>> subjectExams = {};
  String searchQuery = '';

  void setSearchQuery(String query) {
    searchQuery = query;
    update();
  }

  List<ExerciseModel>? get filteredExams {
    final subjectExamsForSelectedTeacher = subjectExams[selectedTeacher.name];
    if (subjectExamsForSelectedTeacher == null) {
      return null;
    }

    return subjectExamsForSelectedTeacher
        .where((exam) =>
            exam.arName.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchData();
  }

  Future<void> fetchData() async {
    subjName = args['subject'] as String;
    try {
      final teachersFromApi = await service.fetchTeacherNames(
        "6495d071a13af5b54e73ab3f",
        subjName,
      );
      final exercisesFromApi = await service.fetchStudentExams(
        // userId: args['userId'] as String,
        "6495d071a13af5b54e73ab3f",
        subjName,
      );
      subjectExams = exercisesFromApi;
      teachers = teachersFromApi;
      selectedTeacher = teachers[0];
      update();
    } catch (e) {}

    // Handle the error
  }

  void onSelect(int index) {
    final teacher = teachers[index];
    selectedTeacher = teacher;
    update();
  }
}
