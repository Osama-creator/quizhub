import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quizhub/app/modules/mcq_exercise/controllers/mcq_exercise_controller.dart';
import 'package:quizhub/app/modules/mcq_exercise/views/question_body.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/views/timer.dart';

class McqExerciseView extends GetView<McqExerciseController> {
  const McqExerciseView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<McqExerciseController>(
      init: controller,
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("1/14"),
              leading: const Icon(Icons.close),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "إختر",
                    style: context.textTheme.headline6!
                        .copyWith(color: AppColors.light),
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const CountdownTimer(duration: 10),
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
                          image: controller.quistionList[index].image ?? "",
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
                      child: Text(
                        controller.qNumber == controller.quistionList.length
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
