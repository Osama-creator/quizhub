import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:queen/facades/prefs.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/helper/client.dart';
import 'package:quizhub/helper/log.dart';

class AuthController extends GetxController {
  final service = Get.find<AuthService>();
  bool isLoggedIn = false;

  Future<void> signOut() async {
    await service.signOut();
    await checkAndNavigate();
  }

  Future<void> deleteAccount() async {
    bool confirmed = false;
    await AwesomeDialog(
      context: Get.context!,
      title: 'هل انت متاكد من حذف الحساب',
      desc: 'لا يمكن الرجوع في هذا الخطوة ابدا',
      btnOkText: 'حذف',
      btnCancelText: 'رجوع',
      btnCancelOnPress: () => confirmed = false,
      btnOkOnPress: () => confirmed = true,
    ).show();
    if (confirmed) {
      // await service.deleteAccount();
      await signOut();
    }
  }

  Future<void> navigateToProperPage() async {
    final userRole = Prefs.getString('user_role');
    if (userRole == "teacher") {
      Get.offAllNamed(Routes.TEACHER_HOME);
    } else {
      Get.offAllNamed(Routes.HOME);
    }
  }

  Future<void> checkAndNavigate() async {
    await checkAuthStatus();
    await navigateToProperPage();
  }

  Future<void> checkAuthStatus() async {
    try {
      // await service.userFromApi();
      final token = Prefs.getString('token');

      if (token.isNotEmpty) {
        isLoggedIn = true;
      }
      authLog('checkAuthStatus isLoggedIn = $isLoggedIn');
    } on DioError {
      // await service.signOut();
      update();
    } on ApiMessage catch (e) {
      // user is not logged in
      if (e.msg == 'Unauthenticated.') {
        await service.signOut();
      }
    } finally {
      isLoggedIn = service.isLoggedIn;
      update();
    }
  }
}
