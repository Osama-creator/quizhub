import 'package:get/get.dart';

import 'package:quizhub/app/models/school_details.dart';
import 'package:quizhub/app/services/admin.dart';
import 'package:quizhub/helper/func.dart';

class AdminTeachersOfSchoolController extends GetxController {
  final schoolName = Get.arguments as String;
  final service = Get.find<AdminService>();
  SchoolDetailsModel? school;
  final action = Get.find<ActionHandel>();
  bool lauding = false;
  bool error = false;

  @override
  Future<void> onInit() async {
    await action.performAction(
      () async {
        school = await service.getSchoolMembers(schoolName: schoolName);
      },
      lauding,
      error,
    );
    super.onInit();
  }
}
