import 'package:get/get.dart';
import 'package:queen/queen.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/app/services/auth.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigateToHomePage();
    super.onInit();
  }

  Future<void> navigateToHomePage() async {
    await oneSecond();
    final authService = Get.find<AuthService>();
    final userData = await authService.cachedUser;
    if (userData != null) {
      authService.navigateToProperPage();
    } else {
      Get.offAllNamed(Routes.SIGN_IN);
    }
  }
}
