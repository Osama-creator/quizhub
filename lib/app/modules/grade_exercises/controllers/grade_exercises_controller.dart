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
  bool loading = false;
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
    try {
      loading = true;
      update();
      await fetchExercises(teacherId, gradeId, examsService);
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      loading = false;
      update();
    }
  }

  Future<void> fetchExercises(
    String teacherId,
    String gradeId,
    ExamsService examsService,
  ) async {
    exercises = await examsService.fetchExercises(
      teacherId: teacherId,
      gradeId: gradeId,
    );
  }

  Future<void> deleteExercise(
    String exId,
  ) async {
    try {
      loading = true;
      update();
      await examsService.deleteExam(
        examId: exId,
      );
      exercises.removeWhere((element) => element.id == exId);
      update();
      Alert.success(Tr.deleteSuccess.tr);
    } catch (e, st) {
      catchLog(e, st);
      Alert.error(Tr.error.tr);
    } finally {
      loading = false;
      update();
    }
  }

  Future<void> submet() async {
    trans();
    try {
      loading = true;
      update();
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
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      loading = false;
      update();
    }
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
