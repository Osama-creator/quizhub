import 'package:get/get.dart';
import 'package:quizhub/app/models/envitations.dart';
import 'package:quizhub/app/services/student_exercises.dart';

class EnvitationsListController extends GetxController {
  final service = Get.find<StudentExamsService>();
  List<Invitation> invitations = [];
  @override
  Future<void> onInit() async {
    invitations.addAll(
      await service.getEnvitations(userId: "userId"),
    );
    update();
    super.onInit();
  }
}
