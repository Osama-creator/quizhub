import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/parent_home/controllers/parent_home_controller.dart';
import 'package:quizhub/app/modules/parent_home/views/widget.dart';
import 'package:quizhub/app/modules/student_home/views/widgets.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/views/center_loading.dart';

class ParentHomeView extends GetView<ParentHomeController> {
  const ParentHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParentHomeController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              controller.userName,
              style: context.textTheme.titleLarge,
            ),
            centerTitle: false,
            backgroundColor: AppColors.light,
            leading: Padding(
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
            actions: [
              SettingButton(
                controller: controller.auth,
                color: AppColors.primary,
                textColor: AppColors.light,
              )
            ],
            elevation: 3,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Text(
                  'الطلاب الذين تتابعهم',
                  style: context.textTheme.headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
              GetBuilder<ParentHomeController>(
                init: controller,
                builder: (_) {
                  return Expanded(
                    child: controller.lauding
                        ? const CenterLoading()
                        : controller.students.isEmpty
                            ? const Center(
                                child: Text("لا يوجد بيانات"),
                              )
                            : ListView.builder(
                                itemCount: controller.students.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: StudentsListTile(
                                      controller: controller,
                                      student: controller.students[index],
                                    ),
                                  );
                                },
                              ),
                  );
                },
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.SEARCH_FOR_STUDENTS);
                },
                child: Center(
                  child: Text(
                    'البحث عن طلاب',
                    style: context.textTheme.titleLarge,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
