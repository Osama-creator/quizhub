import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/services/admin.dart';

class TeachersProfilesListController extends GetxController {
  final service = Get.find<AdminService>();
  bool lauding = false;
  List<TeacherModel> orders = [];
  @override
  Future<void> onInit() async {
    try {
      lauding = true;
      update();
      orders = await service.getNonConfirmedAccounts();
      log(orders[0].name);
    } finally {
      lauding = false;
      update();
    }
    super.onInit();
  }
}
