import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/complate_exercise/controllers/complate_exercise_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/views/input_feild.dart';
import 'package:quizhub/views/timer.dart';

class ComplateExerciseView extends GetView<ComplateExerciseController> {
  const ComplateExerciseView({super.key});
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
              "أكمل",
              style:
                  context.textTheme.headline6!.copyWith(color: AppColors.light),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const CountdownTimer(duration: 50),
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: controller.questionList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text(
                        controller.questionList[index].question,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      InputField(
                        onChanged: (value) {
                          controller.questionList[index].userAnswer = value;
                        },
                        hint: 'ادخل اجابتك  ...',
                        height: context.height * 0.1,
                      ),
                      // TextField(
                      //   onChanged: (value) {
                      //     controller.questionList[index].userAnswer = value;
                      //   },
                      //   decoration: const InputDecoration(
                      //     hintText: 'ادخل اجابتك  ...',
                      //   ),
                      // ),
                      const Spacer(),
                      SizedBox(
                        height: context.height * 0.06,
                        width: context.width * 0.8,
                        child: ElevatedButton(
                          onPressed: controller.checkAnswer,
                          child: const Text('تأكيد'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}