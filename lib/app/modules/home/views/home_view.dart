import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/folwed_teachers/controllers/folwed_teachers_controller.dart';
import 'package:quizhub/app/modules/home/controllers/home_controller.dart';
import 'package:quizhub/app/modules/student_home/views/widgets.dart';
import 'package:quizhub/app/routes/app_pages.dart';

import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';
import 'package:quizhub/views/divider.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(Tr.teacherPage.tr),
          ),
          body: controller.loading
              ? const CenterLoading()
              : Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: CircleAvatar(
                        maxRadius: 85,
                        backgroundImage: NetworkImage(
                          controller.teacher.image.isEmpty
                              ? "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg"
                              : controller.teacher.image,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.teacher.name,
                            style: context.textTheme.headlineSmall!.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            '${controller.teacher.followStudent.length} ${Tr.following.tr}',
                            style: context.textTheme.titleLarge!
                                .copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${Tr.teacherLabel.tr} ${controller.teacher.material}",
                            style: context.textTheme.titleLarge!.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            width: context.width * 0.22,
                            child: !controller.follow
                                ? ElevatedButton(
                                    onPressed: () async {
                                      await controller.folowStudent();
                                      Get.find<FolwedTeachersController>()
                                          .getData();
                                    },
                                    child: Text(Tr.follow.tr),
                                  )
                                : OutlinedButton(
                                    onPressed: () {},
                                    child: Text(Tr.following.tr),
                                  ),
                          )
                        ],
                      ),
                    ),
                    const MyDivider(),
                    Text(
                      Tr.exerciseSummary.tr,
                      style: context.textTheme.titleLarge!.copyWith(),
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 8.0,
                      children: [
                        ...controller.teacher.exams.map(
                          (exam) {
                            final id = exam.id;
                            final type = exam.type;
                            return GestureDetector(
                              onTap: () {
                                controller.examC
                                    .goToExamPage(id: id!, exerciseType: type!);
                              },
                              child: SizedBox(
                                height: context.height * 0.15,
                                width: context.width * 0.35,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: AppColors.next2Primary,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        exam.arName!,
                                        style: context.textTheme.titleLarge!
                                            .copyWith(
                                          color: AppColors.light,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "${exam.quesiotnsNum!.length} ${Tr.question.tr}",
                                        style: context.textTheme.titleLarge!
                                            .copyWith(
                                          color: AppColors.light,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "${exam.viewNum!.length} ${Tr.ans.tr}",
                                        style: context.textTheme.titleLarge!
                                            .copyWith(
                                          color: AppColors.light,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "${Tr.type.tr} $type ",
                                        style: context.textTheme.titleLarge!
                                            .copyWith(
                                          color: AppColors.light,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        ...controller.teacher.doneExams.map(
                          (doneExam) {
                            final index =
                                controller.teacher.doneExams.indexOf(doneExam);
                            return InkWell(
                              onTap: () {
                                Get.toNamed(
                                  Routes.STUDENTS_GRADES,
                                  arguments: [
                                    "${controller.teacher.doneExams[index].degree} / ${controller.teacher.doneExams[index].exerciseModel.quesiotnsNum!.length}",
                                    controller.teacher.doneExams[index].id
                                  ],
                                );
                              },
                              child: DoneExamCard(
                                examName: controller.teacher.doneExams[index]
                                    .exerciseModel.arName!,
                                degree:
                                    "${Tr.grade.tr} ${controller.teacher.doneExams[index].degree} / ${controller.teacher.doneExams[index].exerciseModel.quesiotnsNum!.length} ",
                                index: controller.teacher.doneExams
                                    .indexOf(doneExam),
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
        );
      },
    );
  }
}
