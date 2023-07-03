import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  UserRole roleName = UserRole.Student;
  String? city;
  String? cityId;
  String? school;
  File? image;
  String? classS;
  String? subject;

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
    if (confermationPasswordC.text != passwordC.text) {
      Alert.error("يجب أن يكون تأكيد كلمه المرور تناسب كلمه المرور");
      // } else if (classS == null) {
      //   Alert.error("يجب إختيار الصف المناسب");
    } else {
      print(getRoleName(roleName));
      try {
        isLoading = true;
        update();
        await service.signUp(
          name: fNameC.text,
          email: emailC.text,
          erea: "مصر",
          governorate: city!,
          school: school!,
          confPassword: confermationPasswordC.text,
          password: passwordC.text,
          roleName: getRoleName(roleName),
          phone: phoneC.text,
          image: image,
          classS: classS,
          subject: subject,
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

  Future<void> pickClass() async {
    final res = await Get.bottomSheet<String?>(const PickClss());
    if (res != null) {
      classS = res;
      update();
    }
  }

  Future<void> pickSubject() async {
    final res = await Get.bottomSheet<String?>(const PickSub());
    if (res != null) {
      subject = res;
      update();
    }
  }

  Future<void> pickCity() async {
    final res = await Get.bottomSheet<String?>(const PickCity());
    if (res != null) {
      city = res;
      update();
    }
  }

  Future<void> pickSchool() async {
    final res = await Get.bottomSheet<String?>(
      PickSchool(
        city: city!,
      ),
    );
    if (res != null) {
      school = res;
      update();
    }
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
}
