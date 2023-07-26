import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/modules/folwed_teachers/controllers/folwed_teachers_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';

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
              style: context.textTheme.titleLarge,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                teacher.subj,
                style: context.textTheme.titleLarge!
                    .copyWith(color: AppColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
