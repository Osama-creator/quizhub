// ignore_for_file: avoid_dynamic_calls, cast_nullable_to_non_nullable

import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizhub/app/models/grade.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/common.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/views/pick_utils.dart';

class TeacherHomeController extends GetxController {
  final service = Get.find<CommonService>();
  final authService = Get.find<AuthService>();
  final ervice = Get.find<ExamsService>();
  String teacherId = "";
  final List<GradeModel> grades = [];
  final List<String> gradesNames = [];
  String teacherName = "";
  String teacherSubject = "";
  int? followLength;
  Future<void> pickClass() async {
    final res = await Get.bottomSheet<String?>(const PickClss());
    // print(!grades.map((e) => e.arName).contains(res));
    if (res != null && !grades.map((e) => e.arName).contains(res)) {
      final GradeModel response =
          await service.addGrades(grade: res, teacherId: teacherId);
      gradesNames.add(res);
      grades.add(response);
      update();
    } else {
      Alert.error("لقد تم اختياره بالفعل ");
    }
  }

  @override
  Future<void> onInit() async {
    fetchTeacherHomeData();
    update();
    super.onInit();
  }

  Future<void> fetchTeacherHomeData() async {
    final userData = await authService.cachedUser;
    try {
      final response =
          await service.getTeacherHomeData(teacherId: userData!.id as String);

      if (response.statusCode == 200) {
        final responseData = response.data;
        final teacherData = responseData['Teacher'];
        teacherName = userData.name;
        teacherId = teacherData['_id'] as String;
        teacherSubject = teacherData['material'] as String;
        followLength = teacherData['follow'].length as int;
        final theGrades = responseData['thegrades'] as List<dynamic>;
        for (final gradeData in theGrades) {
          final grade = gradeData['grades'] as String;
          final gradeId = gradeData['_id'] as String;
          log(gradeId);
          grades.add(GradeModel(arName: grade, id: gradeId));
        }
        update();
      } else {
        throw Exception('Failed to fetch teacher home data');
      }
    } catch (e, st) {
      // log('Error: $e');
      catchLog(e, st);
    }
  }

  void goToGradePage(
    String gradeId,
    String gradeName,
  ) {
    Get.toNamed(
      Routes.GRADE_EXERCISES,
      arguments: {
        'gradeId': gradeId,
        'gradeName': gradeName,
        'teacherId': teacherId
      },
    );
  }
}
