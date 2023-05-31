import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:quizhub/config/enums.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/views/btn.dart';
import 'package:quizhub/views/classes_options.dart';
import 'package:quizhub/views/input_feild.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
                  InputField(
                    hint: 'الإسم الأول',
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
                    hint: 'إسم العائله',
                    controller: controller.lNameC,
                    keyboardType: TextInputType.emailAddress,
                    validators: (val) {
                      if (val == null || val.isEmpty) {
                        return "يجب إدخال إسم العائله";
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
                  if (controller.roleName != UserRole.student) ...[
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    InputField(
                      hint: "رقم الهاتف",
                      controller: controller.phoneC,
                    ),
                  ],
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  if (controller.roleName != UserRole.teacher) ...[
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
                  BookingOption(
                    title: 'المحافظه',
                    subTitle: controller.city ?? 'اختر  المحافظه ',
                    icon: Icons.location_city_rounded,
                    onTap: controller.pickCity,
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  BookingOption(
                    title: 'المدرسه',
                    subTitle: controller.school ?? 'اختر  المدرسه ',
                    icon: Icons.school,
                    onTap: controller.pickSchool,
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildRoleButton(UserRole.teacher, 'Teacher'),
                      const SizedBox(width: 10),
                      buildRoleButton(UserRole.student, 'Student'),
                      const SizedBox(width: 10),
                      buildRoleButton(UserRole.admin, 'Admin'),
                    ],
                  ),
                  Btn(
                    onTap: () {
                      // if (formKey.currentState!.validate()) {
                      controller.submit();
                      // }
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

  Widget buildRoleButton(UserRole role, String label) {
    final isSelected = controller.roleName == role;
    return ElevatedButton(
      onPressed: () {
        controller.roleName = role;
        controller.update();
      },
      style: ButtonStyle(
        backgroundColor: isSelected
            ? MaterialStateProperty.all(AppColors.primary)
            : MaterialStateProperty.all(Colors.white),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : AppColors.primary,
        ),
      ),
    );
  }
}

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({
    super.key,
    required this.controller,
  });

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          width: context.width * 0.5,
          height: context.height * 0.2,
          child: ClipOval(
            child: InkWell(
              onTap: controller.pickImage,
              child: controller.image == null
                  ? const Icon(
                      Icons.camera_alt_outlined,
                      size: 100,
                      color: AppColors.primary,
                    )
                  : Image.file(
                      controller.image!,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
        ),
        if (controller.image != null)
          Positioned(
            left: 0,
            child: IconButton(
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              onPressed: () {
                controller.image = null;
                controller.update();
              },
            ),
          ),
      ],
    );
  }
}
