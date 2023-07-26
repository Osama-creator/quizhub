import 'package:get/get.dart';
import 'package:quizhub/app/modules/envitations_list/controllers/envitations_list_controller.dart';
import 'package:quizhub/app/modules/folwed_teachers/controllers/folwed_teachers_controller.dart';

import 'package:quizhub/app/modules/student_home/controllers/student_home_controller.dart';

class StudentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StudentHomeController>(StudentHomeController());
    Get.put<EnvitationsListController>(EnvitationsListController());
    Get.put<FolwedTeachersController>(FolwedTeachersController());
  }
}
