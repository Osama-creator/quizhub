import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/services/money_financials.dart';

class AdminAddFolowersOrdersController extends GetxController {
  List<TeacherOreders> teachers = [];
  final service = Get.find<FinancialsService>();
  @override
  Future<void> onInit() async {
    teachers = await service.getAddFoOrdersListForAdmin();
    update();

    super.onInit();
  }

  Future<void> cofirm(String text, String id) async {
    await service.confirmAddFOrder(teacherId: id, replay: text);
    teachers.removeWhere((element) => element.id == id);
    update();
  }
}
