import 'package:get/get.dart';

import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/app/services/parent.dart';
import 'package:quizhub/helper/func.dart';

class SearchForStudentsController extends GetxController {
  final service = Get.find<ParentService>();
  List<User> filteredUsers = [];

  List<User> students = [];
  final action = Get.find<ActionHandel>();
  bool lauding = false;
  bool error = false;

  @override
  Future<void> onInit() async {
    await action.performAction(
      () async {
        students
            .addAll(await service.fetchStudents("6499a65d90230b8ecf618780"));
        filteredUsers.addAll(students);
      },
      lauding,
      error,
    );
    update();
    super.onInit();
  }

  void filterUsers(String query) {
    if (query.isEmpty) {
      filteredUsers.clear();
      filteredUsers.addAll(students);
    } else {
      filteredUsers.clear();
      filteredUsers.addAll(
        students.where(
          (user) => user.name.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
    update();
  }

  Future<void> folowStudent({
    required String forwordUserId,
  }) async {
    await action.performAction(
      () async {
        service.folowStudent(
          "6499a65d90230b8ecf618780",
          forwordUserId,
        );
      },
      lauding,
      error,
    );
    final invitedUser = students.firstWhere((user) => user.id == forwordUserId);
    invitedUser.invited = true;
    update();
  }
}
