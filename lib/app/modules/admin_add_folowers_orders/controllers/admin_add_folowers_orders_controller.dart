// ignore_for_file: parameter_assignments

import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/services/money_financials.dart';
import 'package:quizhub/helper/func.dart';

class AdminAddFolowersOrdersController extends GetxController {
  List<TeacherOreders> teachers = [];
  final service = Get.find<FinancialsService>();
  final action = Get.find<ActionHandel>();
  bool lauding = false;
  bool error = false;

  @override
  Future<void> onInit() async {
    try {
      lauding = true;
      update();
      teachers = await service.getAddFoOrdersListForAdmin();
    } finally {
      lauding = false;
      update();
    }
    super.onInit();
  }

  Future<void> confirm(String text, String id) async {
    try {
      lauding = true;
      update();
      await service.confirmAddFOrder(teacherId: id, replay: text);
      teachers.removeWhere((element) => element.id == id);
    } finally {
      lauding = false;
      update();
    }
  }
}
