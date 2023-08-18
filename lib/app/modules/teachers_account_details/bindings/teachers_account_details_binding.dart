import 'package:get/get.dart';

import '../controllers/teachers_account_details_controller.dart';

class TeachersAccountDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeachersAccountDetailsController>(
      () => TeachersAccountDetailsController(),
    );
  }
}
