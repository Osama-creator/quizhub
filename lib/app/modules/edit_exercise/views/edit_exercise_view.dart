// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/modules/edit_exercise/controllers/edit_exercise_controller.dart';
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
                              _buildEditDialog(context, mcqQuestion);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
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

  Future<dynamic> _buildEditDialog(
    BuildContext context,
    McqQuestion mcqQuestion,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        String updatedQuestion = mcqQuestion.question;
        String updatedAnswer = mcqQuestion.rightAnswer;
        String? note = mcqQuestion.note;
        String? updatedAnswer2 = mcqQuestion.wrongAns1;
        String? updatedAnswer3 = mcqQuestion.wrongAns2;
        String? updatedAnswer4 = mcqQuestion.wrongAns3;

        return AlertDialog(
          title: const Text('Update Question'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: mcqQuestion.question,
                decoration: const InputDecoration(
                  labelText: 'Question',
                ),
                onChanged: (value) {
                  updatedQuestion = value;
                },
              ),
              TextFormField(
                initialValue: mcqQuestion.rightAnswer,
                decoration: const InputDecoration(
                  labelText: 'Correct Answer',
                ),
                onChanged: (value) {
                  updatedAnswer = value;
                },
              ),
              if (mcqQuestion.wrongAns1 != null ||
                  mcqQuestion.wrongAns2 != null ||
                  mcqQuestion.wrongAns3 != null) ...[
                TextFormField(
                  initialValue: mcqQuestion.wrongAns1,
                  decoration: const InputDecoration(
                    labelText: 'wrong Answer 1',
                  ),
                  onChanged: (value) {
                    updatedAnswer2 = value;
                  },
                ),
                TextFormField(
                  initialValue: mcqQuestion.wrongAns2,
                  decoration: const InputDecoration(
                    labelText: 'wrong Answer 2',
                  ),
                  onChanged: (value) {
                    updatedAnswer3 = value;
                  },
                ),
                TextFormField(
                  initialValue: mcqQuestion.wrongAns3,
                  decoration: const InputDecoration(
                    labelText: 'wrong Answer 3',
                  ),
                  onChanged: (value) {
                    updatedAnswer4 = value;
                  },
                ),
              ],
              if (mcqQuestion.note != null) ...[
                TextFormField(
                  initialValue: mcqQuestion.note,
                  decoration: const InputDecoration(
                    labelText: 'note',
                  ),
                  onChanged: (value) {
                    note = value;
                  },
                ),
              ]
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                mcqQuestion.question = updatedQuestion;
                mcqQuestion.rightAnswer = updatedAnswer;
                controller.updateQuestion(
                  mcqQuestion: mcqQuestion,
                  id: mcqQuestion.id!,
                );
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
