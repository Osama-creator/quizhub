import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/student_exercises_list/controllers/student_exercises_list_controller.dart';
import 'package:quizhub/app/modules/student_exercises_list/views/widget.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';

class StudentExercisesListView extends GetView<StudentExercisesListController> {
  const StudentExercisesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentExercisesListController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.subjName),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.height * 0.01),
                Center(
                  child: SizedBox(
                    height: context.height * 0.08,
                    width: context.width * 0.9,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.toNamed(
                          Routes.QUESTIONS_POSTS,
                          arguments: {
                            "id": controller.userId,
                            'sub_name': controller.subjName,
                            'is_teacher': false
                          },
                        );
                      },
                      child: Text(
                        "قسم أسئله الطلاب",
                        style: context.textTheme.titleLarge,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.height * 0.01),
                buildTechersList(context, controller),
                const Divider(
                  color: AppColors.primary,
                  endIndent: 20,
                  indent: 20,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                controller.selectedTeacher.profilePic.isEmpty
                                    ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                                    : controller.selectedTeacher.profilePic,
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Text(
                            "  ا  / ${controller.selectedTeacher.name}",
                            style: context.textTheme.titleLarge!.copyWith(
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
                      buildSearchBar(context, controller),
                      const SizedBox(height: 8),
                      GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: controller.filteredExams?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          final bool isDone =
                              controller.filteredExams![index].degree == null;
                          return GestureDetector(
                            onTap: () {
                              final type =
                                  controller.filteredExams![index].type;
                              final id = controller.filteredExams![index].id;

                              if (isDone) {
                                controller.studentHome
                                    .goToExamPage(exerciseType: type!, id: id!);
                              }
                            },
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
                                      controller.filteredExams![index].arName!,
                                      style: context.textTheme.titleLarge!
                                          .copyWith(
                                        color: AppColors.light,
                                      ),
                                    ),
                                    if (isDone) ...[
                                      Text(
                                        "${controller.filteredExams![index].quesiotnsNum!.length} اسئله",
                                        style: context.textTheme.titleLarge!
                                            .copyWith(
                                          color: AppColors.light,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "${controller.filteredExams![index].viewNum!.length} حل",
                                        style: context.textTheme.titleLarge!
                                            .copyWith(
                                          color: AppColors.light,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        " النوع ${controller.filteredExams![index].type}",
                                        style: context.textTheme.titleLarge!
                                            .copyWith(
                                          color: AppColors.light,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ] else ...[
                                      Text(
                                        " الدرجه ${controller.filteredExams![index].degree}  / ${controller.filteredExams![index].quesiotnsNum!.length} ",
                                        style: context.textTheme.titleLarge!
                                            .copyWith(
                                          color: AppColors.light,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ]
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
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
