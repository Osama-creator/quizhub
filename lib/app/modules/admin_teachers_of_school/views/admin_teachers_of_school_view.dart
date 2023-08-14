import 'package:flutter/material.dart';

import 'package:get/get.dart' hide Trans, ContextExtensionss;
import 'package:queen/queen.dart';

import 'package:quizhub/app/modules/admin_teachers_of_school/controllers/admin_teachers_of_school_controller.dart';
import 'package:quizhub/app/modules/admin_teachers_of_school/views/widgets.dart';

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
