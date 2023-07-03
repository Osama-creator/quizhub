import 'package:get/get.dart';

import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/app/services/parent.dart';

class SearchForStudentsController extends GetxController {
  final service = Get.find<ParentService>();
  List<User> filteredUsers = [];

  List<User> students = [];
  @override
  Future<void> onInit() async {
    students.addAll(await service.fetchStudents("6499a65d90230b8ecf618780"));
    // students = ;
    filteredUsers.addAll(students);
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

  void folowStudent({
    required String forwordUserId,
  }) {
    service.folowStudent(
      "6499a65d90230b8ecf618780",
      forwordUserId,
    );

    final invitedUser = students.firstWhere((user) => user.id == forwordUserId);
    invitedUser.invited = true;
    update();
  }
}
