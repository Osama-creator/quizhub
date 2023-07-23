import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/helper/client.dart';
import 'package:quizhub/helper/log.dart';

class AuthController extends GetxController {
  final service = Get.find<AuthService>();
  bool isLoggedIn = false;
  Future<void> navigateToProperPage() async {
    final userData = service.cachedUser;
    log(userData!.name);
    if (userData.roleName == "Teacher") {
      Get.offAllNamed(Routes.TEACHER_HOME, arguments: userData.id);
    } else if (userData.roleName == "Parent") {
      Get.offAllNamed(Routes.PARENT_HOME, arguments: userData.id);
    } else if (userData.roleName == "Student") {
      Get.offAllNamed(Routes.STUDENT_HOME, arguments: userData.id);
    } else {
      Get.offAllNamed(
        Routes.ADMIN_HOME,
      );
    }
  }

  Future<void> checkAndNavigate() async {
    await checkAuthStatus();
    await navigateToProperPage();
  }

  Future<void> checkAuthStatus() async {
    try {
      final userData = service.cachedUser;
      if (userData != null) {
        isLoggedIn = true;
      }
      authLog('checkAuthStatus isLoggedIn = $isLoggedIn');
    } on DioError {
      await service.signOut();
      update();
    } on ApiMessage catch (e) {
      if (e.msg == 'Unauthenticated.') {
        await service.signOut();
      }
    } finally {
      isLoggedIn = service.isLoggedIn;
      update();
    }
  }
}
