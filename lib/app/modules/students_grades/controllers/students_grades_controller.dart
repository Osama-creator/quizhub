import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizhub/app/models/student_degree.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/student_exercises.dart';

class StudentsGradesController extends GetxController {
  final List args = Get.arguments as List;
  final service = Get.find<StudentExamsService>();
  final auth = Get.find<AuthService>();
  List<StudentDegree> studentsGrades = [];
  String degree = '';
  String examId = '';
  String userName = '';
  String userImage = '';
  @override
  Future<void> onInit() async {
    final userData = await auth.cachedUser;
    log(args[1].toString());
    userName = userData!.name;
    userImage = userData.image!;
    degree = args[0] as String;
    examId = args[1] as String;
    studentsGrades = await service.fetchStudentDegrees(examId);
    update();
    super.onInit();
  }
}
