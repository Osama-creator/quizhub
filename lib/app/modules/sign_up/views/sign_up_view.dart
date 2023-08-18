import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans, ContextExtensionss;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:quizhub/app/modules/sign_up/views/wedgets.dart';
import 'package:quizhub/config/enums.dart';
import 'package:quizhub/generated/tr.dart';
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
                    hint: Tr.nameRequiredError.tr,
                    controller: controller.fNameC,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  InputField(
                    hint: Tr.emailHint.tr,
                    controller: controller.emailC,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  if (controller.roleName != UserRole.Student) ...[
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    InputField(
                      hint: Tr.phone.tr,
                      controller: controller.phoneC,
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  InputField(
                    hint: Tr.passwordHint.tr,
                    controller: controller.passwordC,
                    obscure: true,
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  InputField(
                    hint: Tr.confirmPasswordHint.tr,
                    controller: controller.confermationPasswordC,
                    obscure: true,
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  if (controller.roleName == UserRole.Teacher) ...[
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    BookingOption(
                      title: Tr.subjectTitle.tr,
                      subTitle: controller.subject ?? Tr.selectSubject.tr,
                      icon: Icons.school,
                      onTap: () async {
                        await controller.pickSubject(context);
                      },
                    ),
                  ],
                  if (controller.roleName != UserRole.Teacher) ...[
                    BookingOption(
                      title: Tr.yearTitle.tr,
                      subTitle: controller.classS ?? Tr.selectYear.tr,
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
                    title: Tr.governorateTitle.tr,
                    subTitle: controller.city ?? Tr.selectYear.tr,
                    icon: Icons.location_city_rounded,
                    onTap: controller.pickCity,
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  if (controller.city != null) ...[
                    BookingOption(
                      title: Tr.schoolTitle.tr,
                      subTitle: controller.school ?? Tr.selectSchool.tr,
                      icon: Icons.school,
                      onTap: () async {
                        await controller.pickSchool(context);
                      },
                    ),
                  ],
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  Btn(
                    onTap: () {
                      controller.validationAndSubmit();
                    },
                    label: Tr.createAccount.tr,
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
