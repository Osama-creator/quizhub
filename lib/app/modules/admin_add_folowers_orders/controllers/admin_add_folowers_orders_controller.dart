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
    await action.performAction(
      () async {
        teachers = await service.getAddFoOrdersListForAdmin();
      },
      lauding,
      error,
    );
    super.onInit();
  }

  Future<void> confirm(String text, String id) async {
    await action.performAction(
      () async {
        await service.confirmAddFOrder(teacherId: id, replay: text);
        teachers.removeWhere((element) => element.id == id);
      },
      lauding,
      error,
    );
  }
}
