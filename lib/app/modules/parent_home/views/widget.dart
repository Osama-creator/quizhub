import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/app/modules/parent_home/controllers/parent_home_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';

class StudentsListTile extends StatelessWidget {
  final User student;
  final ParentHomeController controller;
  const StudentsListTile({
    super.key,
    required this.controller,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.STUDENT_OVERVIEW, arguments: student);
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
                  student.profilePic.isEmpty
                      ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                      : student.profilePic,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            Text(
              student.name,
              style: context.textTheme.titleLarge,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
