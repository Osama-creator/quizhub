import 'package:get/get.dart';

import '../controllers/financial_dues_controller.dart';

class FinancialDuesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinancialDuesController>(
      () => FinancialDuesController(),
    );
  }
}
