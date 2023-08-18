import 'package:get/get.dart';

import '../controllers/admin_add_advice_controller.dart';

class AdminAddAdviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminAddAdviceController>(
      () => AdminAddAdviceController(),
    );
  }
}
