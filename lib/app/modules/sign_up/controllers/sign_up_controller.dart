import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laravel_exception/laravel_exception.dart';
import 'package:quizhub/app/controllers/auth_controller.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';

class SignUpController extends GetxController {
  final service = Get.find<AuthService>();

  final fNameC = TextEditingController();
  final lNameC = TextEditingController();
  final emailC = TextEditingController();
  final phoneC = TextEditingController();
  final passwordC = TextEditingController();
  final confermationPasswordC = TextEditingController();
  final String roleName = "student";

  bool isLoading = false;

  Future<void> submit() async {
    try {
      isLoading = true;
      update();
      final msg = await service.signUp(
        fName: fNameC.text,
        lName: lNameC.text,
        email: emailC.text,
        password: passwordC.text,
        roleName: roleName,
        phone: phoneC.text,
      );
      await Get.find<AuthController>().checkAndNavigate();
      Alert.success(msg);
    } on LValidationException catch (e) {
      Alert.error(e.firstErrorMessage ?? e.message);
    } catch (e, st) {
      Alert.error(e);
      catchLog(e, st);
    } finally {
      isLoading = false;
      update();
    }
  }
}