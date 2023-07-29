import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/helper/alert.dart';
import 'package:quizhub/helper/func.dart';

class SignInController extends GetxController {
  final service = Get.find<AuthService>();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool isLoading = false;
  Future<void> submit() async {
    if (!emailC.text.isEmail || emailC.text.isEmpty) {
      Alert.error(Tr.emailError.tr);
    } else if (passwordC.text.isEmpty || passwordC.text.length < 6) {
      Alert.error(Tr.passwordLengthError.tr);
    } else {
      try {
        isLoading = true;
        update();
        await service.signIn(
          email: emailC.text,
          password: passwordC.text,
        );
        Alert.success(Tr.done.tr);
      } catch (e, st) {
        Alert.error(Tr.error.tr);
        catchLog(e, st);
      } finally {
        isLoading = false;
        update();
      }
    }
  }
}
