import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/services/teacher.dart';

class SearchForTeachersController extends GetxController {
  final service = Get.find<TeacherService>();
  List<Teacher> filteredTeachers = [];

  List<Teacher> teachers = [];
  @override
  Future<void> onInit() async {
    teachers.addAll(await service.fetchTeachers("64a2c7216193b9068277571f"));
    filteredTeachers.addAll(teachers);
    update();
    super.onInit();
  }

  void filterUsers(String query) {
    if (query.isEmpty) {
      filteredTeachers.clear();
      filteredTeachers.addAll(teachers);
    } else {
      filteredTeachers.clear();
      filteredTeachers.addAll(
        teachers.where(
          (user) => user.name.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
    update();
  }
}
