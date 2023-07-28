import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizhub/app/models/envitations.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/student_exercises.dart';
import 'package:quizhub/helper/func.dart';

class EnvitationsListController extends GetxController {
  final service = Get.find<StudentExamsService>();
  final authService = Get.find<AuthService>();

  List<Invitation> invitations = [];
  @override
  Future<void> onInit() async {
    final userData = await authService.cachedUser;
    if (userData!.id != null) {
      try {
        invitations.addAll(
          await service.getEnvitations(userId: userData.id!),
        );
      } catch (e, st) {
        catchLog(e, st);
      }
    } else {
      log("err in id");
    }
    update();
    super.onInit();
  }
}
