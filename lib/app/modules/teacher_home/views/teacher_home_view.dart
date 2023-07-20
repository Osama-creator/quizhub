import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/teacher_home/controllers/teacher_home_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/assets.dart';

class TeacherHomeView extends GetView<TeacherHomeController> {
  const TeacherHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'م/ ${controller.teacherName}',
          style: context.textTheme.titleLarge,
        ),
        centerTitle: false,
        backgroundColor: AppColors.light,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(Asset.images.teacher),
            backgroundColor: Colors.transparent,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  'مدرس ${controller.teacherSubject} ',
                  style: context.textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  " متابع: 20",
                  style: context.textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.05,
            ),
            Text(
              'الصفوف الدراسيه',
              style: context.textTheme.headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: context.height * 0.05,
            ),
            GetBuilder<TeacherHomeController>(
              init: controller,
              builder: (_) {
                if (controller.grades.isEmpty) {
                  return const Center(
                    child: Text(
                      'لا يوجد صفوف حتى الان',
                      style: TextStyle(fontSize: 18),
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
                controller.pickClass();
              },
              child: Text(
                "  إضافه صف  + ",
                style: context.textTheme.titleLarge,
              ),
            ),
            InkWell(
              onTap: () async {
                await controller.authService.signOut();
              },
              child: Text(
                "خروج",
                style: context.textTheme.titleLarge,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: context.height * 0.06,
                width: context.width,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.FINANCIAL_DUES);
                  },
                  child: Text(
                    'المستحقات الماليه',
                    style: context.textTheme.titleLarge!.copyWith(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
