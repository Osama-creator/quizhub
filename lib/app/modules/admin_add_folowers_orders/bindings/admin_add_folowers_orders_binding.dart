import 'package:get/get.dart';

import '../controllers/admin_add_folowers_orders_controller.dart';

class AdminAddFolowersOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminAddFolowersOrdersController>(
      () => AdminAddFolowersOrdersController(),
    );
  }
}
