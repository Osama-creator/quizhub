import 'package:get/get.dart';
import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/app/services/parent.dart';

class ParentHomeController extends GetxController {
  final service = Get.find<ParentService>();
  List<User> students = [];
  @override
  Future<void> onInit() async {
    students = await service.fetchFolowedStudents("6499a65d90230b8ecf618780");
    update();
    super.onInit();
  }
}
