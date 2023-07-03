import 'package:get/get.dart';

import '../controllers/search_for_students_controller.dart';

class SearchForStudentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchForStudentsController>(
      () => SearchForStudentsController(),
    );
  }
}
