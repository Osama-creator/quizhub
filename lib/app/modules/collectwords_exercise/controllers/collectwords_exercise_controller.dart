// ignore_for_file: prefer_final_locals

import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:quizhub/app/models/exercises.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/modules/home/controllers/home_controller.dart';
import 'package:quizhub/app/modules/student_home/controllers/student_home_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/app/services/student_exercises.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/views/true_false_sheet.dart';
import 'package:word_collector/word_collector.dart';

class CollectwordsExerciseController extends GetxController {
  final String examId = Get.arguments as String;
  late WordCollectorController wordCController;

  late PageController pageController;
  late AudioPlayer audioPlayer;
  final examsService = Get.find<ExamsService>();
  final authService = Get.find<AuthService>();
  final studentExamsService = Get.find<StudentExamsService>();
  final action = Get.find<ActionHandel>();
  List<McqQuestion> quistionList = [];
  int qNumber = 1;
  int degree = 0;
  bool lauding = false;
  bool error = false;
  late Exam exam = Exam(
    id: "id",
    examName: "examName",
    questions: [],
  );
  @override
  Future<void> onInit() async {
    pageController = PageController();
    wordCController = WordCollectorController();
    audioPlayer = AudioPlayer();
    log(examId);
    try {
      lauding = true;
      update();
      exam = await examsService.getExercise(id: examId);
      quistionList = exam.questions;
      for (final question in quistionList) {
        final shuffledWords = question.question.split(" ")..shuffle();
        question.words = shuffledWords.join(" ");
      }
    } catch (e, st) {
      catchLog("err$e", st);
    } finally {
      lauding = false;
      update();
    }

    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    wordCController.dispose();
    super.onClose();
  }

  String combineTexts(Map<int, String> textMap) {
    List<int> sortedKeys = textMap.keys.toList();
    List<String> textList = sortedKeys.map((key) => textMap[key]!).toList();
    return textList.join(' ');
  }

  void checkAnswer() {
    final currentQuestion = quistionList[pageController.page!.toInt()];
    final textResult =
        wordCController.getResult(pageIndex: pageController.page!.toInt());
    log(combineTexts(textResult as Map<int, String>));
    if (combineTexts(textResult) == currentQuestion.question) {
      showAnswerSheet(true, currentQuestion.rightAnswer);
      audioPlayer.play(AssetSource('audio/true.mp3'));
      degree++;
    } else {
      showAnswerSheet(false, currentQuestion.rightAnswer);
      audioPlayer.play(AssetSource('audio/false.mp3'));
    }
    update();
    Future.delayed(const Duration(seconds: 2), () async {
      if (qNumber < quistionList.length) {
        Get.back();
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
        qNumber++;
        update();
      } else {
        finishExam();
      }
    });
  }

  Future<void> finishExam() async {
    try {
      lauding = true;
      update();
      final userData = await authService.cachedUser;
      studentExamsService.postDegree(
        idUser: userData!.id!,
        degree: degree,
        idexam: examId,
      );
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      lauding = false;
      update();
    }
    Get.until((route) => route.settings.name == Routes.COLLECTWORDS_EXERCISE);
    Get.offAndToNamed(
      Routes.STUDENTS_GRADES,
      arguments: ["$degree / ${quistionList.length}", examId],
    );
    await Get.find<StudentHomeController>().fetchSubjects();
    await Get.find<HomeController>().refreshData();
  }
}
