// ignore_for_file: avoid_dynamic_calls

import 'package:get/get.dart';
import 'package:quizhub/app/models/grade.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/app/services/common.dart';
import 'package:quizhub/helper/func.dart';
import 'package:quizhub/views/pick_utils.dart';

class TeacherHomeController extends GetxController {
  final service = Get.find<CommonService>();
  final List<GradeModel> grades = [];
  String teacherName = "";
  String teacherSubject = "";
  String teacherId = "";
  int? followLength;
  Future<void> pickClass() async {
    final res = await Get.bottomSheet<String?>(const PickClss());
    if (res != null) {
      final GradeModel response =
          await service.addGrades(grade: res, teacherId: "33");
      grades.add(response);
      update();
    }
  }

  @override
  void onInit() {
    fetchTeacherHomeData();
    super.onInit();
  }

  Future<void> fetchTeacherHomeData() async {
    try {
      final response = await service.getTeacherHomeData(teacherId: "545");

      if (response.statusCode == 200) {
        final responseData = response.data;

        final teacherData = responseData['Teacher'];
        teacherName = teacherData['name'] as String;
        teacherId = teacherData['_id'] as String;
        teacherSubject = teacherData['material'] as String;
        followLength = teacherData['follow'].length as int;
        final theGrades = responseData['thegrades'] as List<dynamic>;
        for (final gradeData in theGrades) {
          final grade = gradeData['grades'] as String;
          final gradeId = gradeData['_id'] as String;
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
