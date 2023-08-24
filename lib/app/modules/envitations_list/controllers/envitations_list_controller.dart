import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizhub/app/models/envitations.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/student_exercises.dart';
import 'package:quizhub/helper/func.dart';

class EnvitationsListController extends GetxController {
  final service = Get.find<StudentExamsService>();
  final authService = Get.find<AuthService>();
  bool loading = false;
  List<Invitation> invitations = [];
  @override
  Future<void> onInit() async {
    await refreshInv();
    super.onInit();
  }

  Future<void> refreshInv() async {
    final userData = await authService.cachedUser;
    if (userData!.id != null) {
      try {
        loading = true;
        update();
        invitations.assignAll(
          await service.getEnvitations(userId: userData.id!),
        );
      } catch (e, st) {
        catchLog(e, st);
      } finally {
        loading = false;
        update();
      }
    } else {
      log("err in id");
    }
    update();
  }
}
