import 'package:get/get.dart';

import '../controllers/search_for_teachers_controller.dart';

class SearchForTeachersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchForTeachersController>(
      () => SearchForTeachersController(),
    );
  }
}
