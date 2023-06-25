import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quizhub/app/modules/students_grades/controllers/students_grades_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';

import 'package:quizhub/generated/assets.dart';

class StudentsGradesView extends GetView<StudentsGradesController> {
  const StudentsGradesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("درجات الطلاب"),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Get.toNamed(
                Routes.STUDENTS_ENVIT,
                arguments: controller.args,
              ),
              child: Text(
                "دعوة",
                style: context.textTheme.headline6!
                    .copyWith(color: AppColors.light),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                maxRadius: 75,
                backgroundImage: AssetImage(Asset.images.teacher),
                backgroundColor: Colors.transparent,
              ),
            ),
            Text(
              ' أحمد سيد',
              style: context.textTheme.headline4!.copyWith(
                color: AppColors.black,
              ),
            ),
            Text(
              controller.degree,
              style: context.textTheme.headline5,
            ),
            Container(
              height: context.height * 0.7,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStudentGradeTile(context),
                    _buildStudentGradeTile(context),
                    _buildStudentGradeTile(context),
                    _buildStudentGradeTile(context),
                    _buildStudentGradeTile(context),
                    _buildStudentGradeTile(context),
                    _buildStudentGradeTile(context),
                    _buildStudentGradeTile(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildStudentGradeTile(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '1',
          style: context.textTheme.headline6!.copyWith(
            color: AppColors.light,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage(Asset.images.teacher),
            backgroundColor: Colors.transparent,
          ),
        ),
        Text(
          'أحمد سيد',
          style: context.textTheme.headline6!.copyWith(
            color: AppColors.light,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '15 / 15',
            style: context.textTheme.headline6!.copyWith(
              color: AppColors.light,
            ),
          ),
        ),
      ],
    );
  }
}
