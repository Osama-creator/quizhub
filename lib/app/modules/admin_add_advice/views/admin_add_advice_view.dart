import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';

import 'package:quizhub/app/modules/admin_add_advice/controllers/admin_add_advice_controller.dart';
import 'package:quizhub/config/enums.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';
import 'package:quizhub/views/input_feild.dart';

class AdminAddAdviceView extends GetView<AdminAddAdviceController> {
  const AdminAddAdviceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: GetBuilder<AdminAddAdviceController>(
            init: controller,
            builder: (_) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildRoleButton2(
                        UserRole.Teacher,
                        'Teacher',
                        controller,
                      ),
                      const SizedBox(width: 10),
                      buildRoleButton2(
                        UserRole.Student,
                        'Student',
                        controller,
                      ),
                      const SizedBox(width: 10),
                      buildRoleButton2(
                        UserRole.Parent,
                        'Parent',
                        controller,
                      ),
                    ],
                  ),
                  InputField(
                    hint: Tr.title.tr,
                    controller: controller.titleC,
                  ),
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  InputField(
                    height: context.height * 0.6,
                    maxLines: 30,
                    hint: Tr.contant.tr,
                    controller: controller.bodyC,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: controller.submit,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.width * 0.3,
                        vertical: 10,
                      ),
                      child: controller.isLoading
                          ? const CenterLoading()
                          : Text(Tr.save.tr),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget buildRoleButton2(
  UserRole role,
  String label,
  AdminAddAdviceController controller,
) {
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
