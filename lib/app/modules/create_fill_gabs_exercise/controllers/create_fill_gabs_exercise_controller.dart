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

class CreateFillGabsExerciseController extends GetxController {
  final examsService = Get.find<ExamsService>();
  final Map<String, dynamic> arguments = Get.arguments as Map<String, dynamic>;
  late String examId;
  late String teacherId;
  final List<FillQuestionC> questions = [];
  final List<McqQuestion> apiQuestions = [];
  bool isLaoding = false;
  @override
  void onInit() {
    teacherId = arguments['teacherId'] as String;
    examId = arguments['examId'] as String;
    addQuestion();
    super.onInit();
  }

  void addQuestion() {
    final questionC = FillQuestionC();
    questions.add(questionC);
    update();
  }

  void removeQuestion(int index) {
    questions.removeAt(index);
    update();
  }

  Future<void> onSubmit() async {
    for (int i = 0; i < questions.length; i++) {
      final question = questions[i];
      if (question.questionC.text.isEmpty ||
          question.missingWordC.text.isEmpty) {
        Alert.error(Tr.fillAllFields.tr);
        return;
      } else {
        final mcqQuestion = McqQuestion(
          examId: examId,
          teacherId: teacherId,
          image: question.image,
          question: question.questionC.text,
          rightAnswer: question.missingWordC.text,
          note: question.noteC.text,
        );
        apiQuestions.add(mcqQuestion);
        log("done $i");
      }
    }
    try {
      isLaoding = true;
      update();
      for (final question in apiQuestions) {
        await examsService.postMcqQuestion(question);
      }
      Get.find<GradeExercisesController>().refershing();
      Get.back();
      Alert.success(Tr.done.tr);
    } catch (e, st) {
      catchLog(e, st);
      Alert.error(Tr.error.tr);
    } finally {
      isLaoding = false;
      update();
    }
  }
}

class FillQuestionC {
  TextEditingController questionC = TextEditingController();
  TextEditingController missingWordC = TextEditingController();
  TextEditingController noteC = TextEditingController();
  String imageString = "";
  late bool imageUploaded;
  File? image;

  Future<void> pickFile() async {
    final tempImage = await Pick.imageFromGallery();
    if (tempImage != null) {
      image = tempImage;
      Get.find<CreateFillGabsExerciseController>().update();
    }
  }
}
