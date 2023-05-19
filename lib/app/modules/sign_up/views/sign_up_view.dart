import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/views/btn.dart';
import 'package:quizhub/views/input_feild.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.1,
            ),
            Text(
              "إنشاء حساب جديد",
              style: context.textTheme.headline5!
                  .copyWith(color: AppColors.primary),
            ),
            SizedBox(
              height: context.height * 0.1,
            ),
            InputField(
              hint: 'الإسم الأول',
              controller: controller.fNameC,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: context.height * 0.01,
            ),
            InputField(
              hint: 'إسم العائله',
              controller: controller.lNameC,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: context.height * 0.01,
            ),
            InputField(
              hint: 'البريد الإلكتروني',
              controller: controller.emailC,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: context.height * 0.01,
            ),
            InputField(
              hint: "كلمه المرور",
              controller: controller.passwordC,
              obscure: true,
            ),
            SizedBox(
              height: context.height * 0.01,
            ),
            InputField(
              hint: "تأكيد كلمة المرور",
              controller: controller.confermationPasswordC,
              obscure: true,
            ),
            SizedBox(
              height: context.height * 0.01,
            ),
            InputField(
              hint: "رقم الهاتف",
              controller: controller.phoneC,
            ),
            GetBuilder<SignUpController>(
              builder: (_) => Btn(
                onTap: controller.submit,
                label: "إنشاء حساب",
                isLoading: controller.isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
