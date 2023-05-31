import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quizhub/app/modules/student_home/controllers/student_home_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';

import 'package:quizhub/generated/assets.dart';

class StudentHomeView extends GetView<StudentHomeController> {
  const StudentHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentHomeController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.light,
          appBar: AppBar(
            title: Image.asset(
              'assets/images/logo.png', // Replace with your app logo image path
              width: 100,
              height: 100,
              color: AppColors.light,
            ),
            centerTitle: false,
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Handle search action
                },
              ),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                      value: 'option1',
                      child: Text('Option 1'),
                    ),
                    const PopupMenuItem(
                      value: 'option2',
                      child: Text('Option 2'),
                    ),
                    const PopupMenuItem(
                      value: 'option3',
                      child: Text('Option 3'),
                    ),
                  ];
                },
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(Asset.images.teacher),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Text(
                    'أحمد محمود خليل',
                    style: context.textTheme.headline6!
                        .copyWith(color: AppColors.black),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'المواد الدراسية',
                  style: context.textTheme.headline5,
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
        );
      },
    );
  }
}

class SubjectList extends StatelessWidget {
  const SubjectList({
    super.key,
    required this.controller,
  });

  final StudentHomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.subjects.length,
        itemBuilder: (context, index) {
          final subject = controller.subjects[index];
          return GestureDetector(
            onTap: () {
              controller.onSelect(index);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: controller.selectedSubject == subject
                    ? AppColors.primary
                    : AppColors.nextPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(right: 8),
              child: Text(
                subject,
                style: TextStyle(
                  fontSize: 18,
                  color: controller.selectedSubject == subject
                      ? AppColors.light
                      : AppColors.primary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.controller,
  });

  final StudentHomeController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "اللغه العربيه",
                    style: context.textTheme.headline6,
                  ),
                  const Spacer(),
                  Text(
                    "المزيد ...",
                    style: context.textTheme.headline6!.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              TeacherExamsTile(controller: controller),
              TeacherExamsTile(controller: controller),
              TeacherExamsTile(controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}

class TeacherExamsTile extends StatelessWidget {
  const TeacherExamsTile({
    super.key,
    required this.controller,
  });

  final StudentHomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 25,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        height: context.height * 0.23,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(Asset.images.teacher),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Text(
                  'أحمد محمود خليل',
                  style: context.textTheme.headline6!
                      .copyWith(color: AppColors.black),
                ),
              ],
            ),
            SizedBox(
              height: context.height * 0.14,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: controller.subjectExams[controller.selectedSubject]
                        ?.map((exam) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.STUDENT_EXERCISES_LIST);
                        },
                        child: SizedBox(
                          height: context.height * 0.07,
                          width: context.width * 0.35,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: AppColors.next2Primary,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "تاريخ الفراعنه",
                                  style: context.textTheme.headline6!
                                      .copyWith(color: AppColors.light),
                                ),
                                Text(
                                  "10 اسئله",
                                  style: context.textTheme.headline6!
                                      .copyWith(color: AppColors.light),
                                ),
                                Text(
                                  "20 حل",
                                  style: context.textTheme.headline6!
                                      .copyWith(color: AppColors.light),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList() ??
                    [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
