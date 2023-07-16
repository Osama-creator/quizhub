import 'package:flutter/material.dart';

import 'package:get/get.dart' hide Trans, ContextExtensionss;
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/models/user.dart';

import 'package:quizhub/app/modules/admin_teachers_of_school/controllers/admin_teachers_of_school_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';

import 'package:quizhub/generated/assets.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';

class AdminTeachersOfSchoolView
    extends GetView<AdminTeachersOfSchoolController> {
  const AdminTeachersOfSchoolView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminTeachersOfSchoolController>(
      init: controller,
      builder: (_) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text(controller.schoolName),
              centerTitle: true,
              automaticallyImplyLeading: false,
              bottom: TabBar(
                tabs: [
                  Tab(text: Tr.students.tr),
                  Tab(text: Tr.teachers.tr),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                if (controller.lauding)
                  const CenterLoading()
                else
                  controller.error
                      ? Center(
                          child: Text(Tr.errorMessage.tr),
                        )
                      : controller.school!.students.isEmpty
                          ? Center(
                              child: Text(Tr.noDataMessage.tr),
                            )
                          : ListView.builder(
                              itemCount: controller.school!.students.length,
                              itemBuilder: (context, index) {
                                return ListTileCustStudent(
                                  student: controller.school!.students[index],
                                );
                              },
                            ),
                if (controller.lauding)
                  const CenterLoading()
                else
                  controller.error
                      ? Center(
                          child: Text(Tr.errorMessage.tr),
                        )
                      : controller.school!.teachers.isEmpty
                          ? Center(
                              child: Text(Tr.noDataMessage.tr),
                            )
                          : ListView.builder(
                              itemCount: controller.school!.teachers.length,
                              itemBuilder: (context, index) {
                                return ListTileCustTeacher(
                                  teacher: controller.school!.teachers[index],
                                );
                              },
                            ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ListTileCustTeacher extends StatelessWidget {
  final Teacher teacher;
  const ListTileCustTeacher({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.ADMIN_TEACHER_SUMMERY);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.nextPrimary,
            borderRadius: BorderRadius.circular(20),
          ),
          height: context.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage(Asset.images.teacher),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Text(
                teacher.name,
                style: context.textTheme.titleLarge,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '${Tr.teacherLabel.tr}  :${teacher.subj}',
                  style: context.textTheme.titleLarge!
                      .copyWith(color: AppColors.black, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTileCustStudent extends StatelessWidget {
  final User student;
  const ListTileCustStudent({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.ADMIN_TEACHER_SUMMERY);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.nextPrimary,
            borderRadius: BorderRadius.circular(20),
          ),
          height: context.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage(Asset.images.teacher),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Text(
                student.name,
                style: context.textTheme.titleLarge,
              ),
              const Spacer(),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: Text(
              //      student.,
              //     style: context.textTheme.headline6!
              //         .copyWith(color: AppColors.black, fontSize: 18),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
