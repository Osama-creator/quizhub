import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/app/services/stundent_exercises.dart';
import 'package:quizhub/helper/func.dart';

class TrueFalseExerciseController extends GetxController {
  late PageController pageController;
  bool? isTrue;

  int qNumber = 1;
  final examsService = Get.find<ExamsService>();
  final String examId = Get.arguments as String;
  late List<McqQuestion> quistionList = [];
  int degree = 0;
  final studentExamsService = Get.find<StudentExamsService>();

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
      isTrue = true;
      degree++;
    } else {
      isTrue = false;
    }
    update();

    showAnswerSheet(
      isTrue!,
    );
    Future.delayed(const Duration(seconds: 3), () {
      if (qNumber < quistionList.length) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
        qNumber++;
        Get.back();
        update();
      } else {
        studentExamsService.postDegree(
          idUser: "6498688caefa7c31aa92b0a9",
          degree: degree,
          idexam: examId,
        );
        Get.offNamed(
          Routes.STUDENTS_GRADES,
          arguments: "$degree / ${quistionList.length}",
        );
      }
    });
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
              isCorrect ? 'إجابه صحيحه' : 'إجابه خاطئه',
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
    try {
      quistionList = await examsService.getExercise(id: examId);
      update();
    } catch (e, st) {
      catchLog("err$e", st);
    }
    super.onInit();
  }
}
