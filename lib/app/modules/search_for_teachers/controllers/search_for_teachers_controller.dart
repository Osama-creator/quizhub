import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/teacher.dart';
import 'package:quizhub/helper/func.dart';

class SearchForTeachersController extends GetxController {
  final service = Get.find<TeacherService>();
  final authService = Get.find<AuthService>();
  List<Teacher> filteredTeachers = [];

  List<Teacher> teachers = [];
  @override
  Future<void> onInit() async {
    final userData = await authService.cachedUser;
    if (userData!.id != null) {
      try {
        teachers
            .addAll(await service.fetchTeachers("64a2c7216193b9068277571f"));
        filteredTeachers.addAll(teachers);
        update();
      } catch (e, st) {
        catchLog(e, st);
      }
    } else {
      log("id error");
    }
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
