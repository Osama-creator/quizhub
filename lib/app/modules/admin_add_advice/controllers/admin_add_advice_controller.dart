import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/services/admin.dart';
import 'package:quizhub/config/enums.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';

class AdminAddAdviceController extends GetxController {
  UserRole roleName = UserRole.Student;
  final service = Get.find<AdminService>();
  bool isLoading = false;
  String getRoleName(UserRole role) {
    switch (role) {
      case UserRole.Teacher:
        return 'Teacher';
      case UserRole.Student:
        return 'Student';
      case UserRole.Parent:
        return 'Parent';
      default:
        return 'Student';
    }
  }

  TextEditingController titleC = TextEditingController();
  TextEditingController bodyC = TextEditingController();

  void submit() {
    try {
      isLoading = true;
      update();
      if (titleC.text.isNotEmpty && bodyC.text.isNotEmpty) {
        service.postAdvice(
          title: titleC.text,
          body: bodyC.text,
          userRole: getRoleName(roleName),
        );
      }
      Alert.success(Tr.adviceAdded.tr);
      titleC.clear();
      bodyC.clear();
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      isLoading = false;
      update();
    }
  }
}
