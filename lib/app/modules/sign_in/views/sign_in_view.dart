import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/input_feild.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: context.height * 0.3,
              width: context.width * 0.5,
              child: Image.asset("assets/images/logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: InputField(
                hint: Tr.emailHint.tr,
                controller: controller.emailC,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: InputField(
                hint: Tr.passwordHint.tr,
                controller: controller.passwordC,
                obscure: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.1,
                vertical: context.height * 0.05,
              ),
              child: SizedBox(
                height: context.height * 0.06,
                width: context.width,
                child: ElevatedButton(
                  onPressed: () {
                    controller.submit();
                  },
                  child: Text(
                    'تسجيل الدخول',
                    style: context.textTheme.titleLarge!.copyWith(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed(Routes.SIGN_UP),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.1,
                ),
                child: Text(
                  "إنشاء حساب جديد",
                  style: context.textTheme.titleLarge!
                      .copyWith(fontSize: 18, color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
