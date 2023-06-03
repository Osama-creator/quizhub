import 'package:get/get.dart';

import '../controllers/techer_page_controller.dart';

class TecherPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TecherPageController>(
      () => TecherPageController(),
    );
  }
}
