import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/common.dart';
import 'package:quizhub/config/enums.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/helper/pick.dart';
import 'package:quizhub/views/center_loading.dart';
import 'package:quizhub/views/input_feild.dart';
import 'package:quizhub/views/pick_utils.dart';

class SignUpController extends GetxController {
  final service = Get.find<AuthService>();
  final commonService = Get.find<CommonService>();
  final fNameC = TextEditingController();
  final lNameC = TextEditingController();
  final emailC = TextEditingController();
  final phoneC = TextEditingController();
  final subController = TextEditingController();
  final schoolController = TextEditingController();
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

  Future<void> validationAndSubmit() async {
    if (fNameC.text.isEmpty || fNameC.text.length < 6) {
      Alert.error(Tr.nameRequiredError.tr);
    } else if (!emailC.text.isEmail || emailC.text.isEmpty) {
      Alert.error(Tr.emailError.tr);
    } else if ((phoneC.text.isEmpty || phoneC.text.length < 10) &&
        roleName != UserRole.Student) {
      Alert.error(Tr.phoneError.tr);
    } else if (passwordC.text.isEmpty || passwordC.text.length < 6) {
      Alert.error(Tr.passwordLengthError.tr);
    } else if (confermationPasswordC.text != passwordC.text) {
      Alert.error(Tr.passwordConfirmationError.tr);
    } else if ((classS == null || classS!.isEmpty) &&
        roleName != UserRole.Teacher) {
      Alert.error(Tr.classRequiredError.tr);
    } else if (city == null || city!.isEmpty) {
      Alert.error(Tr.cityRequiredError.tr);
    } else if (school == null || school!.isEmpty) {
      Alert.error(Tr.schoolRequiredError.tr);
    } else if ((subject == null || subject!.isEmpty) &&
        roleName == UserRole.Teacher) {
      Alert.error(Tr.subjectRequiredError.tr);
    } else {
      await submit();
    }
  }

  Future<void> submit() async {
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
      Alert.success(Tr.done.tr);
    } catch (e, st) {
      Alert.error(Tr.error.tr);
      catchLog(e, st);
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> addSubject(String subName) async {
    if (roleName == UserRole.Teacher) {
      try {
        isLoading = true;
        update();
        await commonService.addSubj(subjName: subName);
        log("done");
      } catch (e, st) {
        catchLog(e, st);
      } finally {
        isLoading = false;
        update();
        subController.clear();
        Get.back();
      }
    } else {
      Alert.error("لايمكن تنفيذ طلبك");
    }
  }

  Future<void> addSchool(String school, String city) async {
    if (roleName == UserRole.Teacher) {
      try {
        isLoading = true;
        update();
        await commonService.addSchool(city: city, school: school);
        log("done");
      } catch (e, st) {
        catchLog(e, st);
      } finally {
        isLoading = false;
        update();
        schoolController.clear();
        Get.back();
      }
    } else {
      Alert.error("لايمكن تنفيذ طلبك");
    }
  }

  Future<void> pickClass() async {
    final res = await Get.bottomSheet<String?>(
      PickClss(
        onPressed: () {},
      ),
    );
    if (res != null) {
      classS = res;
      update();
    }
  }

  Future<void> pickSubject(BuildContext context) async {
    final res = await Get.bottomSheet<String?>(
      PickSub(
        onPressed: () {
          Get.back();
          addDialog(
            context,
            "اضافه ماده",
            "إسم الماده",
            subController,
            () async {
              addSubject(subController.text);
            },
          );
        },
      ),
    );
    if (res != null) {
      subject = res;
      update();
    }
  }

  Future<void> addDialog(
    BuildContext context,
    String title,
    String hint,
    TextEditingController controller,
    VoidCallback onTap,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              children: [
                InputField(
                  controller: controller,
                  hint: hint,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: onTap,
                  child:
                      isLoading ? const CenterLoading() : const Text("اضافه"),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> pickCity() async {
    final res = await Get.bottomSheet<String?>(const PickCity());
    if (res != null) {
      city = res;
      update();
    }
  }

  Future<void> pickSchool(BuildContext context) async {
    final res = await Get.bottomSheet<String?>(
      PickSchool(
        city: city!,
        onPressed: () {
          Get.back();
          addDialog(
            context,
            "اضافه مدرسه",
            "إسم المدرسه",
            schoolController,
            () async {
              addSchool(schoolController.text, city!);
            },
          );
        },
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
