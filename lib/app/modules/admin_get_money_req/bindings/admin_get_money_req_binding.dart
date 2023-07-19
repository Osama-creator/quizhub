import 'package:get/get.dart';

import '../controllers/admin_get_money_req_controller.dart';

class AdminGetMoneyReqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminGetMoneyReqController>(
      () => AdminGetMoneyReqController(),
    );
  }
}
