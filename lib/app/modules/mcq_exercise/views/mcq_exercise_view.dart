import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/mcq_exercise/controllers/mcq_exercise_controller.dart';
import 'package:quizhub/app/modules/mcq_exercise/views/question_body.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';
import 'package:quizhub/views/timer.dart';

class McqExerciseView extends GetView<McqExerciseController> {
  const McqExerciseView({super.key});
  @override
  Widget build(BuildContext context) {
    void onTimerEnd() {
      controller.finishExam();
    }

    return GetBuilder<McqExerciseController>(
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
                    Tr.choose.tr,
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
                  if (controller.lauding)
                    const CenterLoading()
                  else
                    Expanded(
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller.pageController,
                        itemCount: controller.quistionList.length,
                        itemBuilder: (context, index) {
                          return QuestionBody(
                            controller: controller,
                            index: index,
                            quistion: controller.quistionList[index].question,
                            image: controller.quistionList[index].pic ?? "",
                            notes: controller.quistionList[index].note ?? "",
                            list: [
                              controller.quistionList[index].wrongAns1!,
                              controller.quistionList[index].wrongAns2!,
                              controller.quistionList[index].wrongAns3!,
                              controller.quistionList[index].rightAnswer,
                            ],
                          );
                        },
                      ),
                    ),
                  SizedBox(
                    width: context.width * 0.8,
                    height: context.width * 0.1,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.checkAnswer();
                      },
                      child: controller.lauding
                          ? const CenterLoading()
                          : Text(
                              controller.qNumber ==
                                      controller.quistionList.length
                                  ? "إنهاء"
                                  : "تأكيد",
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
