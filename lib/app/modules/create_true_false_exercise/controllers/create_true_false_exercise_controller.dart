import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/helper/pick.dart';

class CreateTrueFalseExerciseController extends GetxController {
  final examsService = Get.find<ExamsService>();
  final Map<String, dynamic> arguments = Get.arguments as Map<String, dynamic>;
  late String examId;
  late String teacherId;
  final List<TrueFalseQuestion> questions = [];
  final List<McqQuestion> apiQuestions = [];

  @override
  void onInit() {
    teacherId = arguments['teacherId'] as String;
    examId = arguments['examId'] as String;
    addQuestion();
    super.onInit();
  }

  void addQuestion() {
    final question = TrueFalseQuestion();
    questions.add(question);

    update();
  }

  Future<void> onSubmit() async {
    for (int i = 0; i < questions.length; i++) {
      final question = questions[i];
      final apiQuestion = McqQuestion(
        examId: examId,
        teacherId: teacherId,
        image: question.image,
        question: question.question.text,
        rightAnswer: question.answer!,
        note: question.note.text,
      );
      apiQuestions.add(apiQuestion);
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

class TrueFalseQuestion {
  TextEditingController question = TextEditingController();
  TextEditingController note = TextEditingController();
  String? answer;

  String imageString = "";

  File? image;

  Future<void> pickFile() async {
    final tempImage = await Pick.imageFromGallery();
    if (tempImage != null) {
      image = tempImage;
    }
  }
}
