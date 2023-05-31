import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/student_exercises_list/controllers/student_exercises_list_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/assets.dart';

class StudentExercisesListView extends GetView<StudentExercisesListController> {
  const StudentExercisesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentExercisesListController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('الدرسات الإجتماعيه'),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.height * 0.01,
              ),
              _buildTechersList(context),
              const Divider(
                color: AppColors.primary,
                endIndent: 20,
                indent: 20,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
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
                            "  ا  / ${controller.selectedTeacher}",
                            style: context.textTheme.headline6!.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'ملخص التمارين',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: context.height * 0.6,
                        child: GridView.count(
                          padding: const EdgeInsets.all(8),
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          children: controller
                                  .subjectExams[controller.selectedTeacher]
                                  ?.map((exam) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: SizedBox(
                                    height: context.height * 0.07,
                                    width: context.width * 0.35,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: AppColors.primary,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "تاريخ الفراعنه",
                                            style: context.textTheme.headline6!
                                                .copyWith(
                                              color: AppColors.light,
                                            ),
                                          ),
                                          Text(
                                            "10 اسئله",
                                            style: context.textTheme.headline6!
                                                .copyWith(
                                              color: AppColors.light,
                                            ),
                                          ),
                                          Text(
                                            "20 حل",
                                            style: context.textTheme.headline6!
                                                .copyWith(
                                              color: AppColors.light,
                                            ),
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
              )
            ],
          ),
        );
      },
    );
  }

  SizedBox _buildTechersList(BuildContext context) {
    return SizedBox(
      height: context.height * 0.09,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.teachers.length,
        itemBuilder: (context, index) {
          final teacher = controller.teachers[index];
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
                color: controller.selectedTeacher == teacher
                    ? AppColors.primary
                    : AppColors.nextPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(right: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(Asset.images.teacher),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        " ا /$teacher",
                        style: context.textTheme.headline6!.copyWith(
                          color: controller.selectedTeacher == teacher
                              ? AppColors.light
                              : AppColors.black,
                        ),
                      ),
                      Text(
                        "40 متابع",
                        style: context.textTheme.bodySmall!.copyWith(
                          color: controller.selectedTeacher == teacher
                              ? AppColors.light
                              : AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
