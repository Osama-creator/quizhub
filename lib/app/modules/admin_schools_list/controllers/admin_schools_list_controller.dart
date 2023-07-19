import 'package:get/get.dart';
import 'package:quizhub/app/models/school.dart';
import 'package:quizhub/app/services/admin.dart';
import 'package:quizhub/helper/func.dart';

class AdminSchoolsListController extends GetxController {
  final service = Get.find<AdminService>();
  final action = Get.find<ActionHandel>();
  bool lauding = false;
  bool error = false;

  List<SchoolModel> schools = [];
  @override
  Future<void> onInit() async {
    await action.performAction(
      () async {
        schools = await service.getSchoolList();
      },
      lauding,
      error,
    );
    update();

    super.onInit();
  }
}
