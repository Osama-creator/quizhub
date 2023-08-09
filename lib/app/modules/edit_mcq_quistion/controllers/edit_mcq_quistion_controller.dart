import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/modules/edit_exercise/controllers/edit_exercise_controller.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/helper/pick.dart';

class EditMcqQuistionController extends GetxController {
  final question = Get.arguments as McqQuestion;
  final examsService = Get.find<ExamsService>();
  String pic = "";
  @override
  void onInit() {
    pic = question.pic ?? "";
    questionC.text = question.question;
    rightAnswerC.text = question.rightAnswer;
    wrongAnswer1C.text = question.wrongAns1!;
    wrongAnswer2C.text = question.wrongAns2!;
    wrongAnswer3C.text = question.wrongAns3!;
    note.text = question.note ?? "";
    update();
    log(question.id!);
    super.onInit();
  }

  TextEditingController questionC = TextEditingController();
  TextEditingController rightAnswerC = TextEditingController();
  TextEditingController wrongAnswer1C = TextEditingController();
  TextEditingController wrongAnswer3C = TextEditingController();
  TextEditingController wrongAnswer2C = TextEditingController();
  TextEditingController note = TextEditingController();
  File? image;

  Future<void> pickFile() async {
    final tempImage = await Pick.imageFromGallery();
    if (tempImage != null) {
      pic = "";
      image = tempImage;

      update();
    }
  }

  Future<void> updateQuestion() async {
    try {
      await examsService.updateQuestion(
        question: McqQuestion(
          teacherId: "teacherId",
          id: question.id,
          question: questionC.text,
          rightAnswer: wrongAnswer1C.text,
          image: image,
          wrongAns1: wrongAnswer1C.text,
          wrongAns2: wrongAnswer2C.text,
          wrongAns3: wrongAnswer3C.text,
        ),
      );
      await Get.find<EditExerciseController>().editOnInit();
      Get.back();
    } catch (e, st) {
      throw Exception('Error: $e, $st');
    }
  }
}
