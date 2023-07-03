import 'package:get/get.dart';
import 'package:quizhub/app/models/school.dart';
import 'package:quizhub/app/services/admin.dart';

class AdminSchoolsListController extends GetxController {
  final service = Get.find<AdminService>();
  List<SchoolModel> schools = [];
  @override
  Future<void> onInit() async {
    schools = await service.getUniqueSchoolList();
    update();
    super.onInit();
  }
}
