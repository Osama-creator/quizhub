import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:quizhub/app/models/exercises.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/helper/pdf_g.dart';
import 'package:quizhub/helper/pick.dart';

class EditExerciseController extends GetxController {
  final examsService = Get.find<ExamsService>();
  final List<String?> args = Get.arguments as List<String?>;
  String examId = '';
  String type = '';
  bool lauding = false;
  late List<McqQuestion> apiQuestions = [];
  late Exam exam = Exam(
    id: "id",
    time: 0,
    examName: "examName",
    questions: [],
  );
  bool hasImage = false;

  @override
  Future<void> onInit() async {
    examId = args[0]!;
    type = args[1]!;
    PdfGenerator.init();
    log(type);
    try {
      lauding = true;
      update();
      await editOnInit();
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      lauding = false;
      update();
    }

    super.onInit();
  }

  Future<void> editOnInit() async {
    exam = await examsService.getExercise(id: examId);
    apiQuestions = exam.questions;
    update();
  }

  File? image;

  Future<void> pickFile() async {
    final tempImage = await Pick.imageFromGallery();
    if (tempImage != null) {
      image = tempImage;
      hasImage = true;
      update();
    }
  }

  Future<void> deleteQuestion({required String id}) async {
    try {
      lauding = true;
      update();
      await examsService.deleteQuestion(qId: id);
      apiQuestions.removeWhere((element) => element.id == id);
      update();
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      lauding = false;
      update();
    }
  }

  Future<void> updateQuestion({
    required McqQuestion mcqQuestion,
  }) async {
    try {
      lauding = true;
      update();
      await examsService.updateQuestion(question: mcqQuestion);
    } catch (e, st) {
      throw Exception('Error: $e, $st');
    } finally {
      lauding = false;
      update();
    }
  }
}
