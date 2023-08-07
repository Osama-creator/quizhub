import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/student_degree.dart';

import 'package:quizhub/app/modules/students_grades/controllers/students_grades_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';

import 'package:quizhub/generated/assets.dart';
import 'package:quizhub/generated/tr.dart';

class StudentsGradesView extends GetView<StudentsGradesController> {
  const StudentsGradesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Tr.studentsGradesTitle.tr,
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Get.toNamed(
                Routes.STUDENTS_ENVIT,
                arguments: controller.args,
              ),
              child: Text(
                Tr.invite.tr,
                style: context.textTheme.titleLarge!
                    .copyWith(color: AppColors.light),
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder<StudentsGradesController>(
        init: controller,
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: CircleAvatar(
                    maxRadius: 75,
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
                  style: context.textTheme.headlineMedium!.copyWith(
                    color: AppColors.black,
                  ),
                ),
                Text(
                  controller.degree,
                  style: context.textTheme.headlineSmall,
                ),
                Container(
                  height: context.height * 0.7,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: GetBuilder<StudentsGradesController>(
                    init: controller,
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(18),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.studentsGrades.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _buildStudentGradeTile(
                                context,
                                controller.studentsGrades[index],
                                index + 1,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Row _buildStudentGradeTile(
    BuildContext context,
    StudentDegree student,
    int i,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          i.toString(),
          style: context.textTheme.titleLarge!.copyWith(
            color: AppColors.light,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage(Asset.images.teacher),
            backgroundColor: Colors.transparent,
          ),
        ),
        Text(
          student.user.name,
          style: context.textTheme.titleLarge!.copyWith(
            color: AppColors.light,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '${student.degree} / ${student.questionIds}',
            style: context.textTheme.titleLarge!.copyWith(
              color: AppColors.light,
            ),
          ),
        ),
      ],
    );
  }
}
