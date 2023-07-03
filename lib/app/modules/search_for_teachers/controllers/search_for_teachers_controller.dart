import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/services/teacher.dart';

class SearchForTeachersController extends GetxController {
  final service = Get.find<TeacherService>();
  List<Teacher> filteredTeachers = [];

  List<Teacher> teachers = [];
  @override
  Future<void> onInit() async {
    teachers.addAll(await service.fetchTeachers("64a2b0e762f9f59127e4a3c5"));
    // students = ;
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

  void folowStudent({
    required String forwordUserId,
  }) {
    service.folowTeacher(
      idUser: "64a2b07262f9f59127e4a3bb",
      idTeacher: forwordUserId,
    );

    final invitedUser = teachers.firstWhere((user) => user.id == forwordUserId);
    invitedUser.invited = true;
    update();
  }
}
