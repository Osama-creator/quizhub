import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/app/services/stundent_exercises.dart';
import 'package:quizhub/helper/func.dart';

class ComplateExerciseController extends GetxController {
  late PageController pageController;
  final examsService = Get.find<ExamsService>();
  final String examId = Get.arguments as String;
  late List<McqQuestion> quistionList = [];
  int degree = 0;
  final studentExamsService = Get.find<StudentExamsService>();

  void checkAnswer() {
    final currentQuestion = quistionList[pageController.page!.toInt()];
    if (currentQuestion.userChoice == currentQuestion.rightAnswer) {
      degree++;
      showAnswerSheet(true);
    } else {
      showAnswerSheet(false);
    }
    Future.delayed(const Duration(seconds: 3), () {
      if (pageController.page!.toInt() < quistionList.length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
        update();
        Get.back();
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
    try {
      quistionList = await examsService.getExercise(id: examId);
      update();
    } catch (e, st) {
      catchLog("err$e", st);
    }
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
