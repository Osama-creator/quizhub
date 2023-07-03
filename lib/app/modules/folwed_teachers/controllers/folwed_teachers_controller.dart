import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/services/teacher.dart';

class FolwedTeachersController extends GetxController {
  final service = Get.find<TeacherService>();
  List<Teacher> teachers = [];
  @override
  Future<void> onInit() async {
    teachers
        .addAll(await service.fetchFolowedTeachers("64a2c7216193b9068277571f"));
    update();
    super.onInit();
  }
}
