import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/modules/teachers_profiles_list/controllers/teachers_profiles_list_controller.dart';
import 'package:quizhub/app/services/admin.dart';
import 'package:quizhub/generated/tr.dart';

import 'package:quizhub/helper/alert.dart';

class TeachersAccountDetailsController extends GetxController {
  final account = Get.arguments as TeacherModel?;
  final service = Get.find<AdminService>();
  bool lauding = false;
  Future<void> confirmAccount() async {
    try {
      lauding = true;
      update();
      await service.confirmAccount(account!.id);
      Get.back();
      await Get.find<TeachersProfilesListController>().onInit();
    } finally {
      lauding = false;
      update();
    }
    Alert.success(Tr.confirmed.tr);
  }
}
