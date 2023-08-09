import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/exersice.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/generated/tr.dart';
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
  String examId = "";
  // ignore: use_setters_to_change_properties
  void setSelectedExerciseType(String exerciseType) {
    selectedExerciseType = exerciseType;
  }

  @override
  Future<void> onInit() async {
    final Map<String, dynamic> arguments =
        Get.arguments as Map<String, dynamic>;
    gradeId = arguments['gradeId'] as String;
    teacherId = arguments['teacherId'] as String;
    gradeName = arguments['gradeName'] as String;
    await refershing();
    update();
    super.onInit();
  }

  Future<void> refershing() async {
    fetchExercises(teacherId, gradeId, examsService);
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
      Alert.success(Tr.deleteSuccess.tr);
    } catch (e, st) {
      catchLog(e, st);
      Alert.error(Tr.error.tr);
    }
  }

  Future<void> submet() async {
    trans();

    examId = await examsService.createExam(
      examName: eNameC.text,
      examType: selectedExerciseType,
      gradeId: gradeId,
      teacherId: teacherId,
      examTime: int.parse(eTimeC.text),
    );
    eNameC.text = "";
    eTimeC.text = "";
    Get.back();
    getPreperPage();
  }

  void getPreperPage() {
    switch (selectedExerciseType) {
      case "choose":
        Get.toNamed(
          Routes.CREATE_CHOOSE_EXERCISE,
          arguments: {'teacherId': teacherId, 'examId': examId},
        );
        break;
      case "true_false":
        Get.toNamed(
          Routes.CREATE_TRUE_FALSE_EXERCISE,
          arguments: {'teacherId': teacherId, 'examId': examId},
        );
        break;
      case "fill_gabs":
        Get.toNamed(
          Routes.CREATE_FILL_GABS_EXERCISE,
          arguments: {'teacherId': teacherId, 'examId': examId},
        );
        break;
      case "matching":
        Get.toNamed(
          Routes.CREATE_MATCHING_EXERCISE,
          arguments: {'teacherId': teacherId, 'examId': examId},
        );
        break;
      default:
        Alert.error("يجب إختيار نوع التدريب");
        break;
    }
  }

  void trans() {
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
  }
}
