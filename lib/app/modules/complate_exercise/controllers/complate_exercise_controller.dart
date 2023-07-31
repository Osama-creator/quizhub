import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/exercises.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/app/services/student_exercises.dart';
import 'package:quizhub/helper/func.dart';

class ComplateExerciseController extends GetxController {
  late PageController pageController;
  final examsService = Get.find<ExamsService>();
  final authService = Get.find<AuthService>();

  late AudioPlayer audioPlayer;
  final String examId = Get.arguments as String;
  late List<McqQuestion> quistionList = [];
  int qNumber = 1;
  int degree = 0;
  final studentExamsService = Get.find<StudentExamsService>();
  final action = Get.find<ActionHandel>();
  bool lauding = false;
  bool error = false;
  late Exam exam = Exam(
    id: "id",
    time: 0,
    examName: "examName",
    questions: [],
  );
  void checkAnswer() {
    final currentQuestion = quistionList[pageController.page!.toInt()];
    if (currentQuestion.userChoice == currentQuestion.rightAnswer) {
      degree++;
      audioPlayer.play(AssetSource('audio/true.mp3'));
      showAnswerSheet(true);
    } else {
      audioPlayer.play(AssetSource('audio/false.mp3'));
      showAnswerSheet(false);
    }
    Future.delayed(const Duration(seconds: 2), () async {
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
    await action.performAction(
      () async {
        final userData = await authService.cachedUser;
        studentExamsService.postDegree(
          idUser: userData!.id!,
          degree: degree,
          idexam: examId,
        );
      },
      lauding,
      error,
    );

    Get.offNamed(
      Routes.STUDENTS_GRADES,
      arguments: ["$degree / ${quistionList.length}", examId],
    );
  }

  void showAnswerSheet(bool isCorrect) {
    Get.bottomSheet(
      Container(
        color: isCorrect ? Colors.green : Colors.red,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isCorrect ? 'إجابة صحيحة' : 'إجابة خاطئة',
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
    pageController = PageController();
    audioPlayer = AudioPlayer();
    await action.performAction(
      () async {
        exam = await examsService.getExercise(id: examId);
        quistionList = exam.questions;
      },
      lauding,
      error,
    );
    update();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
