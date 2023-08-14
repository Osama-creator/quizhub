import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/teacher.dart';
import 'package:quizhub/helper/func.dart';

class FolwedTeachersController extends GetxController {
  final service = Get.find<TeacherService>();
  final authS = Get.find<AuthService>();
  List<Teacher> teachers = [];
  bool loading = false;
  @override
  Future<void> onInit() async {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    final userData = await authS.cachedUser;
    if (userData!.id != null) {
      try {
        loading = true;
        update();
        teachers.assignAll(
          await service.fetchFolowedTeachers(userData.id!),
        );
        update();
      } catch (e, st) {
        catchLog(e, st);
      } finally {
        loading = false;
        update();
      }
    } else {
      log("user id is null");
    }
  }
}
