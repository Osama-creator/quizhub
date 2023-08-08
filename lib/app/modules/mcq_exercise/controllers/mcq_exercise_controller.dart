import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/exercises.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/modules/home/controllers/home_controller.dart';
import 'package:quizhub/app/modules/student_home/controllers/student_home_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/app/services/student_exercises.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/helper/func.dart';

class McqExerciseController extends GetxController {
  late PageController pageController;
  bool? isTrue;
  late AudioPlayer aAudioPlayer;
  int qNumber = 1;
  final authService = Get.find<AuthService>();

  final examsService = Get.find<ExamsService>();
  final String examId = Get.arguments as String;
  Exam exam = Exam(
    id: "id",
    examName: "examName",
    questions: [],
  );
  late List<McqQuestion> quistionList = [];
  int degree = 0;
  final studentExamsService = Get.find<StudentExamsService>();

  @override
  Future<void> onInit() async {
    pageController = PageController();

    aAudioPlayer = AudioPlayer();
    log(examId);
    try {
      exam = await examsService.getExercise(id: examId);
      quistionList = exam.questions;
      update();
    } catch (e, st) {
      catchLog("err$e", st);
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
    studentExamsService.postDegree(
      idUser: userData!.id!,
      degree: degree,
      idexam: examId,
    );
    Get.find<StudentHomeController>().fetchSubjects();
    Get.find<HomeController>().refreshData();
    Get.until((route) => route.settings.name == Routes.MCQ_EXERCISE);
    Get.offAndToNamed(
      Routes.STUDENTS_GRADES,
      arguments: ["$degree / ${quistionList.length}", examId],
    );
  }

  // ignore: avoid_positional_boolean_parameters
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
              isCorrect ? Tr.trueAn.tr : Tr.falseAn.tr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
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
