import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/views/text_field.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "إنشاء حساب جديد",
              style: context.textTheme.headline5!
                  .copyWith(color: AppColors.primary),
            ),
            SizedBox(
              height: context.height * 0.1,
            ),
            MyTextFeild(
              width: context.width * 0.8,
              hintText: 'أسامه عصام ..',
              labelText: "الاسم",
            ),
            MyTextFeild(
              width: context.width * 0.8,
              hintText: 'example@gmail.com',
              labelText: "الايميل",
              keyboardType: TextInputType.emailAddress,
            ),
            MyTextFeild(
              width: context.width * 0.8,
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
                  onPressed: () {},
                  child: Text(
                    'إنشاء حساب',
                    style: context.textTheme.headline6!.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
