import 'package:get/get.dart';

import 'package:quizhub/app/models/school_details.dart';
import 'package:quizhub/app/services/admin.dart';
import 'package:quizhub/helper/func.dart';

class AdminTeachersOfSchoolController extends GetxController {
  final schoolName = Get.arguments as String;
  final service = Get.find<AdminService>();
  SchoolDetailsModel? school =
      const SchoolDetailsModel(students: [], teachers: []);
  final action = Get.find<ActionHandel>();
  bool lauding = false;
  bool error = false;

  @override
  Future<void> onInit() async {
    try {
      lauding = true;
      update();
      school = await service.getSchoolMembers(schoolName: schoolName);
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      lauding = false;
      update();
    }
    super.onInit();
  }
}
