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

class McqExerciseController extends GetxController {
  final String examId = Get.arguments as String;
  late PageController pageController;
  late AudioPlayer aAudioPlayer;
  final authService = Get.find<AuthService>();
  final examsService = Get.find<ExamsService>();
  final studentExamsService = Get.find<StudentExamsService>();
  List<McqQuestion> quistionList = [];
  bool? isTrue;
  int qNumber = 1;
  int degree = 0;
  bool lauding = false;
  bool error = false;
  Exam exam = Exam(
    id: "id",
    examName: "examName",
    questions: [],
  );

  @override
  Future<void> onInit() async {
    pageController = PageController();
    aAudioPlayer = AudioPlayer();
    log(examId);
    try {
      lauding = true;
      update();
      exam = await examsService.getExercise(id: examId);
      quistionList = exam.questions;
    } catch (e, st) {
      catchLog("err$e", st);
    } finally {
      lauding = false;
      update();
    }
    super.onInit();
  }

  int qIndex() {
    final int n =
        pageController.hasClients ? pageController.page?.toInt() ?? 0 : 0;
    update();
    return n;
  }

  void selectChoice(String value) {
    final currentQuestion = quistionList[pageController.page!.toInt()];
    currentQuestion.userChoice = value;

    update();
  }

  void checkAnswer() {
    final currentQuestion = quistionList[pageController.page!.toInt()];
    if (currentQuestion.userChoice == currentQuestion.rightAnswer) {
      isTrue = true;
      aAudioPlayer.play(AssetSource('audio/true.mp3'));
      degree++;
    } else {
      isTrue = false;
      aAudioPlayer.play(AssetSource('audio/false.mp3'));
    }
    update();
    showAnswerSheet(isTrue!, currentQuestion.rightAnswer);
    Future.delayed(const Duration(seconds: 2), () {
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
    final userData = await authService.cachedUser;

    try {
      lauding = true;
      update();
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
    Get.until((route) => route.settings.name == Routes.MCQ_EXERCISE);
    Get.offAndToNamed(
      Routes.STUDENTS_GRADES,
      arguments: ["$degree / ${quistionList.length}", examId],
    );
    await Get.find<StudentHomeController>().fetchSubjects();
    await Get.find<HomeController>().refreshData();
  }
}
