import 'package:get/get.dart';

import '../controllers/edit_mcq_quistion_controller.dart';

class EditMcqQuistionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMcqQuistionController>(
      () => EditMcqQuistionController(),
    );
  }
}
