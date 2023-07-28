import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/student_home/controllers/student_home_controller.dart';
import 'package:quizhub/app/modules/student_home/views/widgets.dart';
import 'package:quizhub/config/theme.dart';

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
                    'المواد الدراسية',
                    style: context.textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: 8),
                SubjectList(
                  controller: controller,
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: AppColors.primary,
                  endIndent: 20,
                  indent: 20,
                  thickness: 1,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'الاختبارات',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
