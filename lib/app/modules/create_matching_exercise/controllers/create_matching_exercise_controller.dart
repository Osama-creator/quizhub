import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';

class CreateMatchingExerciseController extends GetxController {
  final examsService = Get.find<ExamsService>();
  final Map<String, dynamic> arguments = Get.arguments as Map<String, dynamic>;
  late String examId;
  late String teacherId;
  final List<MatchingQuestionC> questions = [];
  final List<McqQuestion> apiQuestions = [];

  @override
  void onInit() {
    teacherId = arguments['teacherId'] as String;
    examId = arguments['examId'] as String;
    addQuestion();
    super.onInit();
  }

  void addQuestion() {
    final questionC = MatchingQuestionC();
    questions.add(questionC);

    update();
  }

  Future<void> onSubmit() async {
    for (int i = 0; i < questions.length; i++) {
      final question = questions[i];
      final mcqQuestion = McqQuestion(
        examId: examId,
        teacherId: teacherId,
        question: question.word.text,
        rightAnswer: question.secondWord.text,
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

class MatchingQuestionC {
  TextEditingController word = TextEditingController();
  TextEditingController secondWord = TextEditingController();
}
