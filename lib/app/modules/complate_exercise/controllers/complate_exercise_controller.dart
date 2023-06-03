import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/questions.dart';

import 'package:quizhub/app/routes/app_pages.dart';

class ComplateExerciseController extends GetxController {
  late PageController pageController;
  List<FillTheGapsQuestion> questionList = [
    FillTheGapsQuestion(
      id: '1',
      question: 'My name __________ John.',
      correctAnswer: 'is',
    ),
    FillTheGapsQuestion(
      id: '2',
      question: 'She ________ a doctor.',
      correctAnswer: 'is',
    ),
    FillTheGapsQuestion(
      id: '3',
      question: 'They ________ in Paris.',
      correctAnswer: 'live',
    ),
    FillTheGapsQuestion(
      id: '4',
      question: 'We ________ football every Sunday.',
      correctAnswer: 'play',
    ),
  ];

  void checkAnswer() {
    final currentQuestion = questionList[pageController.page!.toInt()];
    if (currentQuestion.userAnswer == currentQuestion.correctAnswer) {
      showAnswerSheet(true);
    } else {
      showAnswerSheet(false);
    }
    Future.delayed(const Duration(seconds: 3), () {
      if (pageController.page!.toInt() < questionList.length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
        update();
        Get.back();
      } else {
        Get.toNamed(Routes.MATCHING_EXERCISE);
      }
    });
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
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
