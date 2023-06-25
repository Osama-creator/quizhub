import 'package:get/get.dart';

class StudentsGradesController extends GetxController {
  final List args = Get.arguments as List;
  String degree = '';
  @override
  void onInit() {
    degree = args[0] as String;
    update();
    super.onInit();
  }
}
