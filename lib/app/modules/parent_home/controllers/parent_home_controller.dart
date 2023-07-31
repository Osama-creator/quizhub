import 'package:get/get.dart';
import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/parent.dart';
import 'package:quizhub/helper/func.dart';

class ParentHomeController extends GetxController {
  final service = Get.find<ParentService>();
  List<User> students = [];
  final action = Get.find<ActionHandel>();
  final auth = Get.find<AuthService>();
  String userName = "";
  String userImage = "";
  bool lauding = false;
  bool error = false;

  @override
  Future<void> onInit() async {
    final userData = await auth.cachedUser;
    userName = userData!.name;
    userImage = userData.image!;
    await action.performAction(
      () async {
        students = await service.fetchFolowedStudents(userData.id!);
      },
      lauding,
      error,
    );
    update();
    super.onInit();
  }
}
