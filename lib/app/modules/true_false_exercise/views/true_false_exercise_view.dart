import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/true_false_exercise/controllers/true_false_exercise_controller.dart';
import 'package:quizhub/app/modules/true_false_exercise/views/q_body.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/timer.dart';

class TrueFalseExerciseView extends GetView<TrueFalseExerciseController> {
  const TrueFalseExerciseView({super.key});
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    void onTimerEnd() {
      controller.finishExam();
    }

    return GetBuilder<TrueFalseExerciseController>(
      init: controller,
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "${controller.qNumber} / ${controller.quistionList.length}",
              ),
              leading: InkWell(
                onTap: () => Get.back(),
                child: const Icon(Icons.close),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Tr.trueOrFalse.tr,
                    style: context.textTheme.titleLarge!
                        .copyWith(color: AppColors.light),
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  if (controller.exam.time != null) ...[
                    CountdownTimer(
                      durationInMinutes: controller.exam.time!,
                      onTimerEnd: onTimerEnd,
                    ),
                  ],
                  SizedBox(
                    height: h * 0.8,
                    width: w,
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller.pageController,
                      itemCount: controller.quistionList.length,
                      itemBuilder: (context, index) {
                        return TFQuestionBody(
                          controller: controller,
                          index: index,
                          quistion: controller.quistionList[index].question,
                          image: controller.quistionList[index].pic ?? "",
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
