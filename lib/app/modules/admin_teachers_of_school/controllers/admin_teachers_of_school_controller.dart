import 'package:get/get.dart';

import 'package:quizhub/app/models/school_details.dart';
import 'package:quizhub/app/services/admin.dart';

class AdminTeachersOfSchoolController extends GetxController {
  final schoolName = Get.arguments as String;
  final service = Get.find<AdminService>();
  SchoolDetailsModel? school;
  @override
  Future<void> onInit() async {
    school = await service.getSchoolMembers(schoolName: schoolName);
    update();
    super.onInit();
  }
}
