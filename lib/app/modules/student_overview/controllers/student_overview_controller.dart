import 'package:get/get.dart';
import 'package:quizhub/app/models/exersice.dart';

import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/parent.dart';
import 'package:quizhub/helper/func.dart';

class StudentOverviewController extends GetxController {
  final studentData = Get.arguments as User;
  final service = Get.find<ParentService>();
  final authService = Get.find<AuthService>();
  List<ExerciseModel> exams = [];
  final action = Get.find<ActionHandel>();
  bool lauding = false;
  bool error = false;

  @override
  Future<void> onInit() async {
    final userData = await authService.cachedUser;
    try {
      lauding = true;
      update();
      exams = await service.fetchExams(
        userId: studentData.id,
        parentId: userData!.id!,
      );
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      lauding = false;
      update();
    }

    super.onInit();
  }
}
