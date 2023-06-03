import 'package:get/get.dart';

import '../controllers/envitations_list_controller.dart';

class EnvitationsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnvitationsListController>(
      () => EnvitationsListController(),
    );
  }
}
