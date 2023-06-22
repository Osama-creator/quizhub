import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/app/controllers/auth_controller.dart';
import 'package:quizhub/app/services/auth.dart';

class SignInController extends GetxController {
  final service = Get.find<AuthService>();

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool isLoading = false;
  Future<void> submit() async {
    try {
      isLoading = true;
      update();
      await service.signIn(
        email: emailC.text,
        password: passwordC.text,
      );

      await Get.find<AuthController>().checkAndNavigate();
      Alert.success("تم بنجاح");
    } catch (e, st) {
      Alert.error("عذرا هناك خطأ ما !!");
      catchLog(e, st);
    } finally {
      isLoading = false;
      update();
    }
  }
}
