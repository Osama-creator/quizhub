import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laravel_exception/laravel_exception.dart';
import 'package:quizhub/app/controllers/auth_controller.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/config/enums.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/helper/pick.dart';
import 'package:quizhub/views/pick_utils.dart';

class SignUpController extends GetxController {
  final service = Get.find<AuthService>();

  final fNameC = TextEditingController();
  final lNameC = TextEditingController();
  final emailC = TextEditingController();
  final phoneC = TextEditingController();
  final passwordC = TextEditingController();
  final confermationPasswordC = TextEditingController();
  UserRole roleName = UserRole.student;
  File? image;
  String? classS;

  bool isLoading = false;
  Future<void> pickImage() async {
    final tempImage = await Pick.imageFromGallery();
    if (tempImage != null) {
      image = tempImage;
      log(image.toString());
      update();
    }
  }

  Future<void> submit() async {
    try {
      isLoading = true;
      update();
      final msg = await service.signUp(
        fName: fNameC.text,
        lName: lNameC.text,
        email: emailC.text,
        password: passwordC.text,
        roleName: getRoleName(roleName),
        phone: phoneC.text,
        image: image!.path,
        classS: classS!,
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

  Future<void> pickClass() async {
    final res = await Get.bottomSheet<String?>(const PickClss());
    if (res != null) {
      classS = res;
      update();
    }
  }

  String getRoleName(UserRole role) {
    switch (role) {
      case UserRole.teacher:
        return 'teacher';
      case UserRole.student:
        return 'student';
      case UserRole.admin:
        return 'admin';
      default:
        return 'student';
    }
  }
}
