import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/exersice.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';

class GradeExercisesController extends GetxController {
  List<ExerciseModel> exercises = [];
  final eNameC = TextEditingController();
  final eTimeC = TextEditingController();
  final examsService = Get.find<ExamsService>();
  String teacherId = "";
  String gradeId = "";
  String gradeName = "";
  String selectedExerciseType = '';

  void setSelectedExerciseType(String exerciseType) {
    selectedExerciseType = exerciseType;
  }

  @override
  void onInit() {
    final Map<String, dynamic> arguments =
        Get.arguments as Map<String, dynamic>;

    if (arguments != null) {
      teacherId = arguments['teacherId'] as String;
      gradeId = arguments['gradeId'] as String;
      gradeName = arguments['gradeName'] as String;
      fetchExercises(teacherId, gradeId, examsService);
    } else {
      // Handle missing arguments error
    }

    super.onInit();
  }

  Future<void> fetchExercises(
    String teacherId,
    String gradeId,
    ExamsService examsService,
  ) async {
    try {
      exercises = await examsService.fetchExercises(
        teacherId: teacherId,
        gradeId: gradeId,
      );
      update();
    } catch (e, st) {
      catchLog(e, st);
    }
  }

  Future<void> deleteExercise(
    String exId,
  ) async {
    try {
      await examsService.deleteExam(
        examId: exId,
      );
      exercises.removeWhere((element) => element.id == exId);
      update();
      Alert.success("تم الحذف بنجاح");
    } catch (e, st) {
      catchLog(e, st);
      Alert.error("هنا خطأ ما");
    }
  }

  Future<void> submet() async {
    switch (selectedExerciseType) {
      case "اختيار":
        selectedExerciseType = "choose";
        break;
      case 'صح وخطأ':
        selectedExerciseType = "true_false";
        break;
      case "أكمل":
        selectedExerciseType = "fill_gabs";
        break;
      case "توصيل":
        selectedExerciseType = "matching";
        break;
      default:
        selectedExerciseType = "choose";
        break;
    }
    examsService.createExam(
      examName: eNameC.text,
      examType: selectedExerciseType,
      gradeId: gradeId,
      teacherId: teacherId,
      examTime: int.parse(eTimeC.text),
    );
  }
}
