import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/matching_exercise/controllers/matching_exercise_controller.dart';

import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/timer.dart';

class MatchingExerciseView extends GetView<MatchingExerciseController> {
  const MatchingExerciseView({super.key});
  void onTimerEnd() {
    controller.finishExam();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.close),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Tr.selectMatchingWords.tr,
              style: context.textTheme.titleLarge!
                  .copyWith(color: AppColors.light),
            ),
          )
        ],
      ),
      body: GetBuilder<MatchingExerciseController>(
        init: controller,
        builder: (_) {
          return controller.questions.isEmpty
              ? const Center(child: Text("Congratulations "))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (controller.exam.time != null) ...[
                      CountdownTimer(
                        durationInMinutes: controller.exam.time!,
                        onTimerEnd: onTimerEnd,
                      ),
                    ],
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
                  ],
                );
        },
      ),
    );
  }
}
