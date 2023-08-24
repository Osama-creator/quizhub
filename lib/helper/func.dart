// ignore_for_file: parameter_assignments

import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/enums.dart';

void catchLog(Object e, StackTrace st) {
  log('[error] => $e');
  log('[error stack trace] => $st');
}

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

void goToExamPage({required String id, required String exerciseType}) {
  switch (exerciseType) {
    case "choose":
      Get.toNamed(Routes.MCQ_EXERCISE, arguments: id);
      break;
    case "true_false":
      Get.toNamed(Routes.TRUE_FALSE_EXERCISE, arguments: id);
      break;
    case "fill_gabs":
      Get.toNamed(Routes.COMPLATE_EXERCISE, arguments: id);
      break;
    case "matching":
      Get.toNamed(Routes.MATCHING_EXERCISE, arguments: id);
      break;
    case "collect_words":
      Get.toNamed(Routes.COLLECTWORDS_EXERCISE, arguments: id);
      break;
  }
}

class ActionHandel extends GetxController {
  Future<void> performAction(
    Future<void> Function() action,
    // ignore: avoid_positional_boolean_parameters
    bool lauding,
    bool error,
  ) async {
    try {
      lauding = true;
      update();
      await action();
    } catch (e) {
      log(e.toString());
      error = true;
    } finally {
      lauding = false;
      update();
    }
  }
}
