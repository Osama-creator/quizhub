import 'package:get/get.dart';
import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/student_exercises.dart';
import 'package:quizhub/helper/func.dart';

class StudentsEnvitController extends GetxController {
  final List<String?> examId = Get.arguments as List<String?>;
  final studentExamsService = Get.find<StudentExamsService>();
  final authService = Get.find<AuthService>();
  List<User> users = [];
  List<User> filteredUsers = [];
  Future<String> userId() async {
    final userData = await authService.cachedUser;
    return userData!.id!;
  }

  bool loading = false;

  @override
  Future<void> onInit() async {
    final String id = await userId();
    try {
      loading = true;
      update();
      users.addAll(
        await studentExamsService.fetchStudentToEnvite(
          userId: id,
        ),
      );
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      loading = false;
      update();
    }
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
          (user) => user.name.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
    update();
  }

  Future<void> enviteFriend({
    required String forwordUserId,
  }) async {
    final String id = await userId();
    try {
      loading = true;
      update();
      studentExamsService.eviteFriend(
        forwordUserId: forwordUserId,
        examId: examId[1]!,
        userId: id,
      );

      final invitedUser = users.firstWhere((user) => user.id == forwordUserId);
      invitedUser.invited = true;
    } catch (e, st) {
      catchLog(e, st);
    } finally {
      loading = false;
      update();
    }
  }
}
