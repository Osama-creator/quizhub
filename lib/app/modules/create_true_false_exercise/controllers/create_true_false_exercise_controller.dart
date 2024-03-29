import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/modules/grade_exercises/controllers/grade_exercises_controller.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/generated/tr.dart';
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
  bool isLoading = false;
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

  void removeQuestion(int index) {
    questions.removeAt(index);
    update();
  }

  Future<void> onSubmit() async {
    for (int i = 0; i < questions.length; i++) {
      final question = questions[i];
      if (question.question.text.isEmpty ||
          question.answer!.isEmpty ||
          question.answer == null) {
        Alert.error(Tr.fillAllFields.tr);
        return;
      } else {
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
    }
    try {
      isLoading = true;
      update();
      for (final question in apiQuestions) {
        await examsService.postMcqQuestion(question);
        Get.find<GradeExercisesController>().refershing();
      }
      Get.back();
      Alert.success(Tr.done.tr);
    } catch (e, st) {
      catchLog(e, st);
      Alert.error(
        Tr.errorMessage.tr,
      );
    } finally {
      isLoading = false;
      update();
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
      Get.find<CreateTrueFalseExerciseController>().update();
    }
  }
}
