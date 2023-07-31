import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quizhub/app/modules/home/controllers/home_controller.dart';
import 'package:quizhub/app/modules/student_home/views/widgets.dart';

import 'package:quizhub/config/theme.dart';
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
            title: const Text("صفحه المدرس"),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  maxRadius: 85,
                  backgroundImage: NetworkImage(
                    controller.teacher.image.isEmpty
                        ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdg7OR2pD_kj3sPHW5fmqpmXyhmDZwm_MHUXU36Ipvw4esNWqnz-iiA7AkWeqe1jla218&usqp=CAU"
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
                      '${controller.teacher.followStudent.length} متابع ',
                      style: context.textTheme.titleLarge!.copyWith(),
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
                      "مدرس ${controller.teacher.material}",
                      style: context.textTheme.titleLarge!.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.22,
                      child: !controller.follow
                          ? ElevatedButton(
                              onPressed: () {
                                controller.folowStudent();
                              },
                              child: const Text("متابعه"),
                            )
                          : OutlinedButton(
                              onPressed: () {},
                              child: const Text("متابع"),
                            ),
                    )
                  ],
                ),
              ),
              const MyDivider(),
              Text(
                "ملخص التمارين",
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  exam.arName!,
                                  style: context.textTheme.titleLarge!.copyWith(
                                    color: AppColors.light,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "${exam.quesiotnsNum!.length} اسئله",
                                  style: context.textTheme.titleLarge!.copyWith(
                                    color: AppColors.light,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "${exam.viewNum!.length} حل",
                                  style: context.textTheme.titleLarge!.copyWith(
                                    color: AppColors.light,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "النوع $type ",
                                  style: context.textTheme.titleLarge!.copyWith(
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
                      return DoneExamCard(
                        examName: controller
                            .teacher.doneExams[index].exerciseModel.arName!,
                        degree:
                            " الدرجه ${controller.teacher.doneExams[index].degree} / ${controller.teacher.doneExams[index].exerciseModel.quesiotnsNum!.length} ",
                        index: controller.teacher.doneExams.indexOf(doneExam),
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
