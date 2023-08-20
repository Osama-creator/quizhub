import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/student_home/views/widgets.dart';
import 'package:quizhub/app/modules/teacher_home/controllers/teacher_home_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';

class TeacherHomeView extends GetView<TeacherHomeController> {
  const TeacherHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherHomeController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
              color: AppColors.light,
            ),
            centerTitle: false,
            actions: [
              SettingButton(controller: controller.authService),
              buildWhatsAppButton(),
            ],
          ),
          body: controller.loading
              ? const CenterLoading()
              : !controller.isConfirmed
                  ? Center(
                      child: Text(Tr.accountNonActice.tr),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    controller.image.isEmpty
                                        ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                                        : controller.image,
                                  ),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              Text(
                                ' ${controller.teacherName}',
                                style: context.textTheme.titleLarge,
                              ),
                              const Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: context.height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              controller.teacherSubject,
                              style: context.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: context.height * 0.05,
                          ),
                          Text(
                            Tr.classrooms.tr,
                            style: context.textTheme.headlineSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: context.height * 0.05,
                          ),
                          Center(
                            child: SizedBox(
                              height: context.height * 0.08,
                              width: context.width * 0.9,
                              child: OutlinedButton(
                                onPressed: () {
                                  Get.toNamed(
                                    Routes.QUESTIONS_POSTS,
                                    arguments: {
                                      'id': controller.teacherId,
                                      'sub_name': controller.teacherSubject,
                                      'is_teacher': true
                                    },
                                  );
                                },
                                child: Text(
                                  Tr.studentQuestionsSection.tr,
                                  style: context.textTheme.titleLarge,
                                ),
                              ),
                            ),
                          ),
                          GetBuilder<TeacherHomeController>(
                            init: controller,
                            builder: (_) {
                              if (controller.grades.isEmpty) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: context.height * 0.15,
                                  ),
                                  child: Text(
                                    Tr.noClassroomsYet.tr,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              } else {
                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.grades.length,
                                  padding: const EdgeInsets.all(5),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.90,
                                  ),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        controller.goToGradePage(
                                          controller.grades[index].id!,
                                          controller.grades[index].arName,
                                        );
                                      },
                                      child: Card(
                                        child: Center(
                                          child: Text(
                                            controller.grades[index].arName,
                                            textAlign: TextAlign.center,
                                            style: context.textTheme.titleLarge!
                                                .copyWith(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          ),
                          InkWell(
                            onTap: () {
                              controller.pickClass(context);
                            },
                            child: Text(
                              Tr.addClassroom.tr,
                              style: context.textTheme.titleLarge,
                            ),
                          ),
                          SizedBox(
                            height: context.height * 0.1,
                          ),
                        ],
                      ),
                    ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: !controller.isConfirmed
              ? const SizedBox()
              : SizedBox(
                  height: context.height * 0.06,
                  width: context.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.FINANCIAL_DUES);
                    },
                    child: Text(
                      Tr.financialDues.tr,
                      style: context.textTheme.titleLarge!.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget buildWhatsAppButton() {
    return IconButton(
      icon: const Icon(Icons.message), // You can choose a different icon
      onPressed: () {
        controller.openWhatsApp();
      },
    );
  }
}
