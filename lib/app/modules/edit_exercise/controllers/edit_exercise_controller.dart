import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizhub/app/models/exercises.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/helper/pdf_g.dart';

class EditExerciseController extends GetxController {
  final examsService = Get.find<ExamsService>();
  final List<String?> args = Get.arguments as List<String?>;
  String examId = '';
  String type = '';
  late List<McqQuestion> apiQuestions = [];
  late Exam exam = Exam(
    id: "id",
    time: 0,
    examName: "examName",
    questions: [],
  );

  @override
  Future<void> onInit() async {
    examId = args[0]!;
    type = args[1]!;
    log(examId);
    try {
      exam = await examsService.getExercise(id: examId);
      apiQuestions = exam.questions;
      update();
      update();
    } catch (e, st) {
      catchLog("err$e", st);
    }
    PdfGenerator.init();
    update();

    super.onInit();
  }

  Future<void> updateQuestion({
    required McqQuestion mcqQuestion,
    required String id,
  }) async {
    try {
      final body = {
        "IdQuestion": id,
        "question": mcqQuestion.question,
        "correct_Answer": mcqQuestion.rightAnswer,
        if (mcqQuestion.image != null) 'img': mcqQuestion.image,
      };

      await examsService.updateQuestion(body: body);

      // Handle success
    } catch (e, st) {
      // Handle error
      throw Exception('Error: $e, $st');
    }
  }
}
