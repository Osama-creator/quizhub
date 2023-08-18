// ignore_for_file: prefer_final_locals

import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/exercises.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/modules/student_home/controllers/student_home_controller.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/app/services/student_exercises.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/helper/func.dart';
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

  void checkAnswer() {
    final currentQuestion = quistionList[pageController.page!.toInt()];
    final textResult =
        wordCController.getResult(pageIndex: pageController.page!.toInt());
    String combineTexts(Map<int, String> textMap) {
      List<int> sortedKeys = textMap.keys.toList();
      List<String> textList = sortedKeys.map((key) => textMap[key]!).toList();
      return textList.join(' ');
    }

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
      Get.back();
      Get.back();
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      lauding = false;
      update();
    }
    await Get.find<StudentHomeController>().fetchSubjects();
    // await Get.find<HomeController>().refreshData();
  }

  void showAnswerSheet(bool isCorrect, String correctAnswer) {
    Get.bottomSheet(
      Container(
        color: isCorrect ? Colors.green : Colors.red,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isCorrect ? Tr.trueAn.tr : Tr.isWrong.tr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            if (!isCorrect)
              Text(
                '${Tr.trueAn.tr} هي: $correctAnswer',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
      barrierColor: Colors.black54,
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      isDismissible: false,
    );
  }
}
