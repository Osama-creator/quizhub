import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/teacher_model.dart';
import 'package:quizhub/app/models/user.dart';
import 'package:quizhub/config/theme.dart';

import 'package:quizhub/app/routes/app_pages.dart';

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
      ),
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
                      .copyWith(color: AppColors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}