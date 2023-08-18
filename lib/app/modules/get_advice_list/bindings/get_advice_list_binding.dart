import 'package:get/get.dart';

import '../controllers/get_advice_list_controller.dart';

class GetAdviceListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetAdviceListController>(
      () => GetAdviceListController(),
    );
  }
}
