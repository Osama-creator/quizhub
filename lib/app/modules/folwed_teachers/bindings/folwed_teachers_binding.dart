import 'package:get/get.dart';

import '../controllers/folwed_teachers_controller.dart';

class FolwedTeachersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FolwedTeachersController>(
      () => FolwedTeachersController(),
    );
  }
}
