import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/helper/pick.dart';

class CreateChooseExerciseController extends GetxController {
  final examsService = Get.find<ExamsService>();
  final Map<String, dynamic> arguments = Get.arguments as Map<String, dynamic>;
  late String examId;
  late String teacherId;
  final List<QuestionC> questions = [];
  final List<McqQuestion> apiQuestions = [];

  @override
  void onInit() {
    teacherId = arguments['teacherId'] as String;
    examId = arguments['examId'] as String;
    super.onInit();
  }

  void addQuestion() {
    final questionC = QuestionC();
    questions.add(questionC);

    update();
  }

  Future<void> onSubmit() async {
    for (int i = 0; i < questions.length; i++) {
      final question = questions[i];
      final mcqQuestion = McqQuestion(
        examId: examId,
        teacherId: teacherId,
        image: question.image!.path,
        question: question.questionC.text,
        rightAnswer: question.rightAnswerC.text,
        wrongAns1: question.wrongAnswer1C.text,
        wrongAns2: question.wrongAnswer2C.text,
        wrongAns3: question.wrongAnswer3C.text,
      );
      apiQuestions.add(mcqQuestion);
      log("done $i");
    }
    try {
      for (final question in apiQuestions) {
        await examsService.postMcqQuestion(question);
      }
      Get.back();
      Alert.success("تم بنجاح");
    } catch (e, st) {
      catchLog(e, st);
      Alert.error("هناك خطأ ما");
    }
  }
}

class QuestionC {
  TextEditingController questionC = TextEditingController();
  TextEditingController rightAnswerC = TextEditingController();
  TextEditingController wrongAnswer1C = TextEditingController();
  TextEditingController wrongAnswer3C = TextEditingController();
  TextEditingController wrongAnswer2C = TextEditingController();
  String imageString = "";
  late bool imageUploaded;
  File? image;

  Future<void> pickFile() async {
    final tempImage = await Pick.imageFromGallery();
    if (tempImage != null) {
      image = tempImage;
    }
  }
}
