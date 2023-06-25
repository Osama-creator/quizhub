import 'package:get/get.dart';
import 'package:quizhub/app/models/user.dart';

import 'package:quizhub/app/services/stundent_exercises.dart';

class StudentsEnvitController extends GetxController {
  final List<String> examId = Get.arguments as List<String>;
  final studentExamsService = Get.find<StudentExamsService>();
  List<User> users = [];
  @override
  Future<void> onInit() async {
    users.addAll(
      await studentExamsService.fetchStudentToEnvite(
        userId: "64987339aefa7c31aa92b158",
      ),
    );
    update();
    super.onInit();
  }

  void enviteFriend({
    required String forwordUserId,
  }) {
    studentExamsService.eviteFriend(
      forwordUserId: forwordUserId,
      examId: examId[1],
      userId: "userId",
    );
    // Update the user's state when invited
    final invitedUser = users.firstWhere((user) => user.id == forwordUserId);
    invitedUser.invited = true;

    update();
  }
}
