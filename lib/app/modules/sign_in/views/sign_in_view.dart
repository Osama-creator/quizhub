import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/views/text_field.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: context.height * 0.3,
              width: context.width * 0.5,
              child: Image.asset("assets/images/logo.png"),
            ),
            MyTextFeild(
              width: context.width * 0.8,
              controller: controller.emailC,
              hintText: 'example@gmail.com',
              labelText: "الايميل",
              keyboardType: TextInputType.emailAddress,
            ),
            MyTextFeild(
              width: context.width * 0.8,
              controller: controller.passwordC,
              hintText: "******",
              labelText: "كلمه السر",
              obscureText: true,
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
                    Get.toNamed(Routes.TEACHER_HOME);
                  },
                  child: Text(
                    'تسجيل الدخول',
                    style: context.textTheme.headline6!.copyWith(
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
                  style: context.textTheme.headline6!
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
