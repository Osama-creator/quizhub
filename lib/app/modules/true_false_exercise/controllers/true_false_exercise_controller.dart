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

class TrueFalseExerciseController extends GetxController {
  late PageController pageController;
  bool? isTrue;
  int qNumber = 1;
  final examsService = Get.find<ExamsService>();
  final authService = Get.find<AuthService>();
  bool isLoading = false;
  late AudioPlayer aAudioPlayer;
  final String examId = Get.arguments as String;
  int degree = 0;
  final studentExamsService = Get.find<StudentExamsService>();
  late Exam exam = Exam(
    id: "id",
    examName: "examName",
    questions: [],
  );
  late List<McqQuestion> quistionList = [];
  // ignore: avoid_positional_boolean_parameters
  void selectChoice(String value) {
    final currentQuestion = quistionList[pageController.page!.toInt()];
    currentQuestion.userChoice = value;
    update();
    checkAnswer();
  }

  void checkAnswer() {
    final currentQuestion = quistionList[pageController.page!.toInt()];
    if (currentQuestion.userChoice == currentQuestion.rightAnswer) {
      aAudioPlayer.play(AssetSource('audio/true.mp3'));
      isTrue = true;
      degree++;
    } else {
      aAudioPlayer.play(AssetSource('audio/false.mp3'));
      isTrue = false;
    }
    update();

    showAnswerSheet(
      isTrue!,
    );
    Future.delayed(const Duration(seconds: 2), () {
      if (qNumber < quistionList.length) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
        qNumber++;
        Get.back();
        update();
      } else {
        finishExam();
      }
    });
  }

  Future<void> finishExam() async {
    try {
      isLoading = true;
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
      isLoading = false;
      update();
    }

    Get.until((route) => route.settings.name == Routes.TRUE_FALSE_EXERCISE);
    Get.offAndToNamed(
      Routes.STUDENTS_GRADES,
      arguments: ["$degree / ${quistionList.length}", examId],
    );
    await Get.find<StudentHomeController>().fetchSubjects();
    await Get.find<HomeController>().refreshData();
  }

  // ignore: avoid_positional_boolean_parameters
  void showAnswerSheet(
    // ignore: avoid_positional_boolean_parameters
    bool isCorrect,
  ) {
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

  @override
  Future<void> onInit() async {
    aAudioPlayer = AudioPlayer();
    pageController = PageController();
    try {
      isLoading = true;
      update();
      exam = await examsService.getExercise(id: examId);
      quistionList = exam.questions;
    } catch (e, st) {
      catchLog("err$e", st);
    } finally {
      isLoading = false;
      update();
    }
    super.onInit();
  }
}
