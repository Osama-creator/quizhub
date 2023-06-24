import 'package:get/get.dart';
import 'package:queen/queen.dart';
import 'package:quizhub/app/controllers/auth_controller.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigateToHomePage();
    super.onInit();
  }

  Future<void> navigateToHomePage() async {
    await oneSecond();
    final controller = Get.find<AuthController>();
    await controller.checkAuthStatus();
    await controller.navigateToProperPage();
  }
}
