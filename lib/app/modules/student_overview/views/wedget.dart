import 'package:flutter/material.dart';
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/student_overview/controllers/student_overview_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';

class SubjectTile extends StatelessWidget {
  final StudentOverviewController controller;
  const SubjectTile({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return controller.lauding
        ? const CenterLoading()
        : controller.exams.isEmpty
            ? Center(
                child: Text(
                  Tr.noDataAvailable.tr,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Divider(
                      color: AppColors.black,
                      endIndent: 20,
                      indent: 20,
                      thickness: 1,
                    ),
                    Text(
                      Tr.exams.tr,
                      style: context.textTheme.headlineSmall,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: controller.exams.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        childAspectRatio: 3 / 2,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          height: context.height * 0.07,
                          width: context.width * 0.3,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "  ${controller.exams[index].arName}",
                                style: context.textTheme.bodyLarge!
                                    .copyWith(color: AppColors.light),
                              ),
                              Text(
                                "${Tr.subjectTitle.tr} :  ${controller.exams[index].subName}",
                                style: context.textTheme.bodyLarge!.copyWith(
                                  color: AppColors.light,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                ' ${Tr.grade.tr} :  ${controller.exams[index].degree} من ${controller.exams[index].quesiotnsNum!.length}',
                                style: context.textTheme.bodyLarge!
                                    .copyWith(color: AppColors.light),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
  }
}
