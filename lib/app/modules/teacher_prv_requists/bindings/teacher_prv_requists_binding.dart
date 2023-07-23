import 'package:get/get.dart';

import '../controllers/teacher_prv_requists_controller.dart';

class TeacherPrvRequistsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherPrvRequistsController>(
      () => TeacherPrvRequistsController(),
    );
  }
}
