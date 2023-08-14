import 'dart:developer';

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
  String userName = "";
  String userImage = "";
  String userId = "";
  List<String> subjects = [];
  List<ExerciseCardModel> exercises = [];
  bool isLoading = false;
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
  Future<void> onReady() async {
    await fetchSubjects();
    super.onReady();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(vsync: this, length: 3);
    final userData = await auth.cachedUser;
    userName = userData!.name;
    userImage = userData.image!;
    userId = userData.id!;

    tabController.addListener(update);
    await fetchSubjects();
  }

  Future<void> fetchSubjects() async {
    if (userId.isNotEmpty) {
      try {
        isLoading = true;
        update();
        final subjectsFromApi = await service.fetchStudentHomeSubjectNames(
          userId,
        );
        subjects = subjectsFromApi;
        selectedSubject = subjects[0];
        onSelectSubject(0);
      } catch (e, st) {
        catchLog(e, st);
      } finally {
        isLoading = false;
        update();
      }
    } else {
      log(" user id is null");
    }
  }

  Future<void> fetchExercisesForSubject(String subjectName) async {
    if (userId.isNotEmpty) {
      try {
        isLoading = true;
        update();
        final exercisesFromApi = await service.fetchStudentExercises(
          userId: userId,
          subject: subjectName,
        );
        exercises = exercisesFromApi;
      } catch (e, st) {
        catchLog(e, st);
      } finally {
        isLoading = false;
        update();
      }
    } else {
      log(" user id is null");
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
