import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/modules/student_home/controllers/student_home_controller.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/teacher.dart';
import 'package:quizhub/helper/func.dart';

class HomeController extends GetxController {
  final String teacherId = Get.arguments as String;
  final service = Get.find<TeacherService>();
  final authService = Get.find<AuthService>();
  final examC = Get.find<StudentHomeController>();
  bool follow = false;
  bool loading = false;
  TeacherModel teacher = TeacherModel(
    id: "id",
    name: "name",
    school: "school",
    governorate: "governorate",
    phone: "",
    area: "area",
    email: "email",
    material: "material",
    role: "role",
    isLoggedIn: true,
    follow: [],
    followStudent: [],
    exams: [],
    doneExams: [],
  );
  @override
  Future<void> onInit() async {
    refreshData();
    super.onInit();
  }

  Future<void> refreshData() async {
    final userData = await authService.cachedUser;
    log(teacherId);
    try {
      loading = true;
      update();
      teacher = await service.getFolowedTeachers(
        idTeacher: teacherId,
        userId: userData!.id!,
      );
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      loading = false;
      update();
    }
  }

  Future<void> folowStudent() async {
    final userData = await authService.cachedUser;
    if (userData!.id != null) {
      try {
        loading = true;
        update();
        await service.folowTeacher(
          idUser: userData.id!,
          idTeacher: teacherId,
        );
        follow = true;
      } catch (e, st) {
        catchLog(e, st);
      } finally {
        loading = false;
        update();
      }
    } else {
      log("id error");
    }
  }
}
