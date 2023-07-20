import 'package:get/get.dart';
import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/app/services/parent.dart';
import 'package:quizhub/helper/func.dart';

class ParentHomeController extends GetxController {
  final service = Get.find<ParentService>();
  List<User> students = [];
  final action = Get.find<ActionHandel>();
  bool lauding = false;
  bool error = false;

  @override
  Future<void> onInit() async {
    await action.performAction(
      () async {
        students =
            await service.fetchFolowedStudents("6499a65d90230b8ecf618780");
      },
      lauding,
      error,
    );
    update();
    super.onInit();
  }
}
