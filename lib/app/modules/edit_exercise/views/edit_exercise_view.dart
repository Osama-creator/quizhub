// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/edit_exercise/controllers/edit_exercise_controller.dart';
import 'package:quizhub/app/modules/edit_exercise/views/widget.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/helper/pdf_g.dart';
import 'package:quizhub/views/center_loading.dart';

class EditExerciseView extends GetView<EditExerciseController> {
  const EditExerciseView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          Tr.edit.tr,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: context.height * 0.06,
                  width: context.width * 0.35,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      Tr.repost.tr,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.06,
                  width: context.width * 0.35,
                  child: OutlinedButton(
                    onPressed: () {
                      if (controller.type != "collect_words" &&
                          controller.type != "matching") {
                        final type = PdfGenerator.createPdf(
                          controller.apiQuestions,
                          controller.type,
                        );
                      }
                    },
                    child: Text(
                      Tr.print.tr,
                    ),
                  ),
                ),
              ],
            ),
            GetBuilder<EditExerciseController>(
              init: controller,
              builder: (_) {
                return controller.lauding
                    ? const CenterLoading()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.apiQuestions.length,
                          itemBuilder: (context, index) {
                            final mcqQuestion = controller.apiQuestions[index];
                            return Card(
                              color: AppColors.grey,
                              child: InkWell(
                                onTap: () {
                                  if (mcqQuestion.wrongAns3 != null) {
                                    Get.toNamed(
                                      Routes.EDIT_MCQ_QUISTION,
                                      arguments: mcqQuestion,
                                    );
                                  } else {
                                    buildEditDialog(
                                      context,
                                      mcqQuestion,
                                      controller,
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          controller.deleteQuestion(
                                            id: mcqQuestion.id!,
                                          );
                                        },
                                        icon: controller.lauding
                                            ? const CenterLoading()
                                            : const Icon(
                                                Icons.delete,
                                                color: AppColors.black,
                                              ),
                                      ),
                                      Text(
                                        "${Tr.question.tr}  : ${mcqQuestion.question}",
                                        style: context.textTheme.titleLarge!
                                            .copyWith(color: AppColors.black),
                                      ),
                                      if (mcqQuestion.pic!.isNotEmpty) ...[
                                        SizedBox(
                                          height: context.height * 0.2,
                                          width: double.infinity,
                                          child: Image.network(
                                            mcqQuestion.pic!,
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      ],
                                      Text(
                                        " ${Tr.correctAnswer.tr}:${mcqQuestion.rightAnswer}",
                                        style: context.textTheme.titleLarge!
                                            .copyWith(fontSize: 16),
                                      ),
                                      if (mcqQuestion.wrongAns2 != null ||
                                          mcqQuestion.wrongAns3 != null) ...[
                                        Text(
                                          " ج 2  :${mcqQuestion.wrongAns1}",
                                          style: context.textTheme.titleLarge!
                                              .copyWith(fontSize: 16),
                                        ),
                                        Text(
                                          " ج 3 :${mcqQuestion.wrongAns2}",
                                          style: context.textTheme.titleLarge!
                                              .copyWith(fontSize: 16),
                                        ),
                                        Text(
                                          "ج 4 :${mcqQuestion.wrongAns3}",
                                          style: context.textTheme.titleLarge!
                                              .copyWith(fontSize: 16),
                                        ),
                                      ],
                                      if (mcqQuestion.note != null) ...[
                                        Text(
                                          "${Tr.notes.tr} :${mcqQuestion.note!}",
                                          style: context.textTheme.titleLarge!
                                              .copyWith(
                                            fontSize: 16,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
            SizedBox(
              height: context.height * 0.07,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(
            Routes.ADD_NEW_QUISTION,
            arguments: [controller.examId, controller.type],
          );
        },
        backgroundColor: AppColors.primary,
        label: Text(
          Tr.addQuestion.tr,
          style: context.textTheme.bodyLarge!
              .copyWith(fontSize: 16, color: AppColors.light),
        ),
        icon: const Icon(
          Icons.add,
          color: AppColors.light,
        ),
      ),
    );
  }
}
