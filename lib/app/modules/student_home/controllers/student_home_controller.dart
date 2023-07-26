import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/exams_card.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/helper/func.dart';

class StudentHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final service = Get.find<ExamsService>();
  final auth = Get.find<AuthService>();
  late TabController tabController;
  String selectedSubject = '';

  List<String> subjects = [];

  List<ExerciseCardModel> exercises = [];

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void changeTab(int index) {
    tabController.animateTo(index);
    update();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(vsync: this, length: 3);
    tabController.addListener(update);
    await fetchSubjects();
  }

  Future<void> fetchSubjects() async {
    try {
      final subjectsFromApi = await service.fetchStudentHomeSubjectNames(
        "6495d071a13af5b54e73ab3f",
      );
      subjects = subjectsFromApi;
      selectedSubject = subjects[0];
      onSelectSubject(0);
      update();
    } catch (e, st) {
      catchLog(e, st);
    }
  }

  Future<void> fetchExercisesForSubject(String subjectName) async {
    try {
      final exercisesFromApi = await service.fetchStudentExercises(
        userId: "6495d071a13af5b54e73ab3f",
        subject: subjectName,
      );
      exercises = exercisesFromApi;

      update();
    } catch (e) {
      // Handle the error
    }
  }

  void onSelectSubject(int index) {
    final subject = subjects[index];
    selectedSubject = subject;
    fetchExercisesForSubject(subject);
    update();
  }

  void goToExamPage({required String id, required String exerciseType}) {
    switch (exerciseType) {
      case "choose":
        Get.toNamed(Routes.MCQ_EXERCISE, arguments: id);
        break;
      case "true_false":
        Get.toNamed(Routes.TRUE_FALSE_EXERCISE, arguments: id);
        break;
      case "fill_gabs":
        Get.toNamed(Routes.COMPLATE_EXERCISE, arguments: id);
        break;
      case "matching":
        Get.toNamed(Routes.MATCHING_EXERCISE, arguments: id);
        break;
    }
  }
}
