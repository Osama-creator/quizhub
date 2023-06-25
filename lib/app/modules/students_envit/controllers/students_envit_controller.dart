import 'package:get/get.dart';
import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/app/services/student_exercises.dart';

class StudentsEnvitController extends GetxController {
  final List<String> examId = Get.arguments as List<String>;
  final studentExamsService = Get.find<StudentExamsService>();
  List<User> users = [];
  List<User> filteredUsers = [];

  @override
  Future<void> onInit() async {
    users.addAll(
      await studentExamsService.fetchStudentToEnvite(
        userId: "64987339aefa7c31aa92b158",
      ),
    );
    filteredUsers.addAll(users);
    update();
    super.onInit();
  }

  void filterUsers(String query) {
    if (query.isEmpty) {
      filteredUsers.clear();
      filteredUsers.addAll(users);
    } else {
      filteredUsers.clear();
      filteredUsers.addAll(
        users.where(
            (user) => user.name.toLowerCase().contains(query.toLowerCase())),
      );
    }
    update();
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
