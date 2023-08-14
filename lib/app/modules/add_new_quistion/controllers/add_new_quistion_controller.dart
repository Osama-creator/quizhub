import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/modules/edit_exercise/controllers/edit_exercise_controller.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/helper/pick.dart';

class AddNewQuistionController extends GetxController {
  final args = Get.arguments as List<String>;
  TextEditingController questionC = TextEditingController();
  TextEditingController rightAnswerC = TextEditingController();
  TextEditingController? wrongAnswer1C = TextEditingController();
  TextEditingController? wrongAnswer3C = TextEditingController();
  TextEditingController? wrongAnswer2C = TextEditingController();
  String? answer;
  bool isLoading = false;
  TextEditingController? note = TextEditingController();
  final authService = Get.find<AuthService>();
  final examsService = Get.find<ExamsService>();

  File? image;

  Future<void> pickFile() async {
    final tempImage = await Pick.imageFromGallery();
    if (tempImage != null) {
      image = tempImage;
      update();
    }
  }

  String id = "";
  String type = "";
  @override
  void onInit() {
    id = args[0];
    type = args[1];
    super.onInit();
  }

  Future<void> addQuesion() async {
    final userData = await authService.cachedUser;

    final question = McqQuestion(
      examId: id,
      teacherId: userData!.id!,
      image: image,
      question: questionC.text,
      rightAnswer: rightAnswerC.text.isEmpty ? answer! : rightAnswerC.text,
      wrongAns1: wrongAnswer1C!.text,
      wrongAns2: wrongAnswer2C!.text,
      wrongAns3: wrongAnswer3C!.text,
      note: note!.text,
    );
    try {
      isLoading = true;
      update();
      await examsService.postMcqQuestion(question);

      Get.back();
      await Get.find<EditExerciseController>().editOnInit();
      Alert.success(Tr.done.tr);
    } catch (e, st) {
      catchLog(e, st);
      Alert.error(Tr.error.tr);
    } finally {
      isLoading = false;
      update();
    }
  }
}
