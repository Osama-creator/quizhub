// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quizhub/app/modules/edit_exercise/controllers/edit_exercise_controller.dart';
import 'package:quizhub/app/modules/edit_exercise/views/widget.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/helper/pdf_g.dart';

class EditExerciseView extends GetView<EditExerciseController> {
  const EditExerciseView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('تعديل'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
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
                  child: const Text("إعاده نشر"),
                ),
              ),
              SizedBox(
                height: context.height * 0.06,
                width: context.width * 0.35,
                child: OutlinedButton(
                  onPressed: () {
                    final type = PdfGenerator.createPdf(
                      controller.apiQuestions,
                      controller.type,
                    );
                  },
                  child: const Text("طباعه"),
                ),
              ),
            ],
          ),
          GetBuilder<EditExerciseController>(
            init: controller,
            builder: (_) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: context.height * 0.8,
                  child: ListView.builder(
                    itemCount: controller.apiQuestions.length,
                    itemBuilder: (context, index) {
                      final mcqQuestion = controller.apiQuestions[index];

                      return Expanded(
                        child: Card(
                          color: AppColors.grey,
                          child: InkWell(
                            onTap: () {
                              buildEditDialog(context, mcqQuestion, controller);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          if (mcqQuestion.wrongAns3 != null) {
                                            Get.toNamed(
                                              Routes.EDIT_MCQ_QUISTION,
                                              arguments: mcqQuestion,
                                            );
                                          } else {
                                            buildEditDialog(context,
                                                mcqQuestion, controller);
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.delete,
                                          color: AppColors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "السؤال  : ${mcqQuestion.question}",
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
                                    "الإجابه الصحيحه :${mcqQuestion.rightAnswer}",
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
                                      "ملاحظه :${mcqQuestion.note!}",
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
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
