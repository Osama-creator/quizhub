import 'package:get/get.dart';
import 'package:quizhub/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    splashController();
    super.onInit();
  }

  Future<void> splashController() async {
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(
        Routes.HOME,
      );
    });
  }
}
