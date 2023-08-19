import 'package:get/get.dart';

import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/app/modules/parent_home/controllers/parent_home_controller.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/parent.dart';
import 'package:quizhub/helper/func.dart';

class SearchForStudentsController extends GetxController {
  final service = Get.find<ParentService>();
  final authService = Get.find<AuthService>();
  List<User> filteredUsers = [];

  List<User> students = [];
  final action = Get.find<ActionHandel>();
  bool lauding = false;
  bool error = false;

  @override
  Future<void> onInit() async {
    final userData = await authService.cachedUser;
    try {
      lauding = true;
      update();
      students.addAll(await service.fetchStudents(userData!.id!));
      filteredUsers.addAll(students);
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      lauding = false;
      update();
    }

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
    final userData = await authService.cachedUser;
    try {
      lauding = true;
      update();
      await service.folowStudent(
        userData!.id!,
        forwordUserId,
      );
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      lauding = false;
      update();
    }

    final invitedUser = students.firstWhere((user) => user.id == forwordUserId);
    invitedUser.invited = true;
    await Get.find<ParentHomeController>().onInit();
    update();
  }
}
