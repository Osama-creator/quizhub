import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/matching_exercise/controllers/matching_exercise_controller.dart';
import 'package:quizhub/app/routes/app_pages.dart';

import 'package:quizhub/config/theme.dart';
import 'package:quizhub/views/timer.dart';

class MatchingExerciseView extends GetView<MatchingExerciseController> {
  const MatchingExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("1/14"),
        leading: const Icon(Icons.close),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "أختر الكلمات المتناسبة",
              style:
                  context.textTheme.headline6!.copyWith(color: AppColors.light),
            ),
          )
        ],
      ),
      body: GetBuilder<MatchingExerciseController>(
        init: controller,
        builder: (_) {
          return controller.questions.isEmpty
              ? const Center(child: Text("Congratulations"))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CountdownTimer(duration: 30),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.0,
                        ),
                        itemCount: controller.questions.length,
                        itemBuilder: (context, index) {
                          final question = controller.questions[index];
                          return GestureDetector(
                            onTap: () {
                              if (!question.isSelectedFWord! &&
                                  !question.isSelectedSWord!) {
                                controller.selectFWord(
                                  question.id!,
                                  question.question,
                                );
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: question.isSelectedFWord!
                                    ? question.isCorrect!
                                        ? Colors.red
                                        : Colors.green
                                    : Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                question.question,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.0,
                        ),
                        itemCount: controller.questions.length,
                        itemBuilder: (context, index) {
                          final question = controller.questions[index];
                          return GestureDetector(
                            onTap: () {
                              if (question.isSelectedFWord! &&
                                  !question.isSelectedSWord! &&
                                  !question.isCorrect!) {
                                controller.selectSWord(
                                  question.id!,
                                  question.rightAnswer,
                                );
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: question.isSelectedSWord!
                                    ? question.isCorrect!
                                        ? Colors.red
                                        : Colors.green
                                    : Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                question.rightAnswer,
                                style: const TextStyle(fontSize: 18.0),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.isAllAnswered()) {
                          Get.toNamed(Routes.STUDENTS_GRADES);
                        } else {
                          // Show a message or prompt to complete all answers
                          Get.snackbar(
                            'Incomplete Answers',
                            'Please select all matching words.',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                      child: const Text('إنهاء'),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
