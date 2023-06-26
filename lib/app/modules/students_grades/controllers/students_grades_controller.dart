import 'package:get/get.dart';
import 'package:quizhub/app/models/student_degree.dart';
import 'package:quizhub/app/services/student_exercises.dart';

class StudentsGradesController extends GetxController {
  final List args = Get.arguments as List;
  final service = Get.find<StudentExamsService>();
  List<StudentDegree> studentsGrades = [];
  String degree = '';
  @override
  Future<void> onInit() async {
    degree = args[0] as String;
    studentsGrades =
        await service.fetchStudentDegrees("6495888458c9a0a165992a8a");
    update();
    super.onInit();
  }
}
