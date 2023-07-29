import 'package:get/get.dart';
import 'package:quizhub/app/models/exersice.dart';
import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/app/modules/student_home/controllers/student_home_controller.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/helper/func.dart';

class StudentExercisesListController extends GetxController {
  final Map<String, dynamic> args = Get.arguments as Map<String, dynamic>;
  final service = Get.find<ExamsService>();
  final authService = Get.find<AuthService>();
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
        .where(
          (exam) =>
              exam.arName.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchData();
  }

  Future<void> fetchData() async {
    final userData = await authService.cachedUser;
    subjName = args['subject'] as String;
    try {
      final teachersFromApi = await service.fetchTeacherNames(
        userData!.id!,
        subjName,
      );
      final exercisesFromApi = await service.fetchStudentExams(
        userData.id!,
        subjName,
      );
      subjectExams = exercisesFromApi;
      teachers = teachersFromApi;
      selectedTeacher = teachers[0];
      update();
    } catch (e, st) {
      catchLog(e, st);
    }
    update();
  }

  void onSelect(int index) {
    final teacher = teachers[index];
    selectedTeacher = teacher;
    update();
  }
}
