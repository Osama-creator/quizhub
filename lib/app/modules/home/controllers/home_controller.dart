import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/modules/student_home/controllers/student_home_controller.dart';
import 'package:quizhub/app/services/teacher.dart';

class HomeController extends GetxController {
  final String teacherId = Get.arguments as String;
  final service = Get.find<TeacherService>();
  final examC = Get.find<StudentHomeController>();
  bool follow = false;
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
  );
  @override
  Future<void> onInit() async {
    log(teacherId);
    teacher = await service.getFolowedTeachers(idTeacher: teacherId);
    update();
    super.onInit();
  }

  Future<void> folowStudent() async {
    await service.folowTeacher(
      idUser: "64a2c7216193b9068277571f",
      idTeacher: teacherId,
    );
    follow = true;
    update();
  }
}
