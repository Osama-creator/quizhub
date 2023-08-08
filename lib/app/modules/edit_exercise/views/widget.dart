// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/modules/edit_exercise/controllers/edit_exercise_controller.dart';
import 'package:quizhub/generated/tr.dart';

Future<dynamic> buildEditDialog(
  BuildContext context,
  McqQuestion mcqQuestion,
  EditExerciseController controller,
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
        title: Text(
          Tr.updateQuestion.tr,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: mcqQuestion.question,
              decoration: InputDecoration(
                labelText: Tr.question.tr,
              ),
              onChanged: (value) {
                updatedQuestion = value;
              },
            ),
            if (mcqQuestion.pic!.isNotEmpty) ...[
              Container(
                color: const Color(0x1AD1EC43),
                width: context.width,
                height: context.height * 0.2,
                child: Image.network(
                  mcqQuestion.pic!,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            TextFormField(
              initialValue: mcqQuestion.rightAnswer,
              decoration: InputDecoration(
                labelText: Tr.correctAnswer.tr,
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
                decoration: InputDecoration(
                  labelText: Tr.wrongAnswer1.tr,
                ),
                onChanged: (value) {
                  updatedAnswer2 = value;
                },
              ),
              TextFormField(
                initialValue: mcqQuestion.wrongAns2,
                decoration: InputDecoration(
                  labelText: Tr.wrongAnswer2.tr,
                ),
                onChanged: (value) {
                  updatedAnswer3 = value;
                },
              ),
              TextFormField(
                initialValue: mcqQuestion.wrongAns3,
                decoration: InputDecoration(
                  labelText: Tr.wrongAnswer3.tr,
                ),
                onChanged: (value) {
                  updatedAnswer4 = value;
                },
              ),
            ],
            if (mcqQuestion.note != null) ...[
              TextFormField(
                initialValue: mcqQuestion.note,
                decoration: InputDecoration(
                  labelText: Tr.notes.tr,
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
            child: Text(
              Tr.cancel.tr,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              mcqQuestion.question = updatedQuestion;
              mcqQuestion.rightAnswer = updatedAnswer;
              controller.updateQuestion(
                mcqQuestion: mcqQuestion,
              );
              Get.find<EditExerciseController>().editOnInit();
              Navigator.pop(context);
            },
            child: Text(
              Tr.edit.tr,
            ),
          ),
        ],
      );
    },
  );
}
