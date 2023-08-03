import 'package:get/get.dart';

import '../controllers/order_response_controller.dart';

class OrderResponseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderResponseController>(
      () => OrderResponseController(),
    );
  }
}
