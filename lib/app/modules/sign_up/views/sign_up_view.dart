import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:quizhub/app/modules/sign_up/views/wedgets.dart';
import 'package:quizhub/config/enums.dart';
import 'package:quizhub/views/btn.dart';
import 'package:quizhub/views/classes_options.dart';
import 'package:quizhub/views/input_feild.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  ProfileImagePicker(
                    controller: controller,
                  ),
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildRoleButton(
                        UserRole.Teacher,
                        'Teacher',
                        controller,
                      ),
                      const SizedBox(width: 10),
                      buildRoleButton(
                        UserRole.Student,
                        'Student',
                        controller,
                      ),
                      const SizedBox(width: 10),
                      buildRoleButton(
                        UserRole.Parent,
                        'Parent',
                        controller,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  InputField(
                    hint: 'الإسم ',
                    controller: controller.fNameC,
                    keyboardType: TextInputType.emailAddress,
                    validators: (val) {
                      if (val == null || val.isEmpty) {
                        return "يجب إدخال الاسم ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  InputField(
                    hint: 'البريد الإلكتروني',
                    controller: controller.emailC,
                    keyboardType: TextInputType.emailAddress,
                    validators: (val) {
                      if (val == null || val.isEmpty) {
                        return "يجب إدخال  البريد الإلكتروني";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  if (controller.roleName != UserRole.Student) ...[
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    InputField(
                      hint: "رقم الهاتف",
                      controller: controller.phoneC,
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  InputField(
                    hint: "كلمه المرور",
                    controller: controller.passwordC,
                    obscure: true,
                    validators: (val) {
                      if (val == null || val.isEmpty) {
                        return "يجب إدخال  كلمه المرور";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  InputField(
                    hint: "تأكيد كلمة المرور",
                    controller: controller.confermationPasswordC,
                    obscure: true,
                    validators: (val) {
                      if (val == null || val.isEmpty) {
                        return "يجب تأكيد  كلمه المرور";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  if (controller.roleName == UserRole.Teacher) ...[
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    BookingOption(
                      title: 'الماده الدراسيه',
                      subTitle: controller.subject ?? 'اختر  الماده الدراسيه',
                      icon: Icons.school,
                      onTap: controller.pickSubject,
                    ),
                  ],
                  if (controller.roleName != UserRole.Teacher) ...[
                    BookingOption(
                      title: 'السنه الدراسيه',
                      subTitle: controller.classS ?? 'اختر  السنه الدراسيه',
                      icon: Icons.class_,
                      onTap: controller.pickClass,
                    ),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                  ],
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  BookingOption(
                    title: 'المحافظه',
                    subTitle: controller.city ?? 'اختر  المحافظه ',
                    icon: Icons.location_city_rounded,
                    onTap: controller.pickCity,
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  if (controller.city != null) ...[
                    BookingOption(
                      title: 'المدرسه',
                      subTitle: controller.school ?? 'اختر  المدرسه ',
                      icon: Icons.school,
                      onTap: controller.pickSchool,
                    ),
                  ],
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  Btn(
                    onTap: () {
                      controller.validationAndSubmit();
                    },
                    label: "إنشاء حساب",
                    isLoading: controller.isLoading,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
