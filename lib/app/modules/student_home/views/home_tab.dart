import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/student_home/controllers/student_home_controller.dart';
import 'package:quizhub/app/modules/student_home/views/widgets.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';

class HomeTab extends GetView<StudentHomeController> {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentHomeController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          // backgroundColor: AppColors.light,

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          controller.userImage.isEmpty
                              ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                              : controller.userImage,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Text(
                      controller.userName,
                      style: context.textTheme.titleLarge!
                          .copyWith(color: AppColors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    Tr.academicSubjects.tr,
                    style:
                        context.textTheme.headlineSmall!.copyWith(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SubjectList(
                    controller: controller,
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: AppColors.primary,
                  endIndent: 20,
                  indent: 20,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    Tr.exams.tr,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                DetailsBody(
                  controller: controller,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
