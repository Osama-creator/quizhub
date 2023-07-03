import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/services/teacher.dart';

class HomeController extends GetxController {
  final String teacherId = Get.arguments as String;
  final service = Get.find<TeacherService>();
  TeacherModel? teacher;
  @override
  Future<void> onInit() async {
    teacher = await service.getFolowedTeachers(idTeacher: teacherId);
    update();
    super.onInit();
  }
}
