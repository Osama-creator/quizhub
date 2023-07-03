import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/modules/folwed_teachers/controllers/folwed_teachers_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';

import 'package:quizhub/config/theme.dart';

class FolwedTeachersView extends GetView<FolwedTeachersController> {
  const FolwedTeachersView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FolwedTeachersController>(
      init: controller,
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Text(
                    'المدرسين الذين تتابعهم',
                    style: context.textTheme.headline5!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.teachers.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TeachersListTile(
                          controller: controller,
                          teacher: controller.teachers[index],
                        ),
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.SEARCH_FOR_TEACHERS);
                  },
                  child: Center(
                    child: Text(
                      'البحث عن مدرسين',
                      style: context.textTheme.headline6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TeachersListTile extends StatelessWidget {
  final Teacher teacher;
  final FolwedTeachersController controller;
  const TeachersListTile({
    super.key,
    required this.controller,
    required this.teacher,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.HOME, arguments: teacher.id);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
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
                backgroundImage: NetworkImage(
                  teacher.profilePic.isEmpty
                      ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                      : teacher.profilePic,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            Text(
              teacher.name,
              style: context.textTheme.headline6,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                teacher.subj,
                style: context.textTheme.headline6!
                    .copyWith(color: AppColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
