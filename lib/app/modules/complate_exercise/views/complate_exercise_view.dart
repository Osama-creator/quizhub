import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans, ContextExtensionss;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/complate_exercise/controllers/complate_exercise_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/input_feild.dart';
import 'package:quizhub/views/timer.dart';

class ComplateExerciseView extends GetView<ComplateExerciseController> {
  const ComplateExerciseView({super.key});
  @override
  Widget build(BuildContext context) {
    void _openDialog(String body) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Notes"),
            content: Text(body),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"),
              ),
            ],
          );
        },
      );
    }

    void onTimerEnd() {
      controller.finishExam();
    }

    return GetBuilder<ComplateExerciseController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
                  Tr.fillGabs.tr,
                  style: context.textTheme.titleLarge!
                      .copyWith(color: AppColors.light),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              if (controller.exam.time != null) ...[
                CountdownTimer(
                  durationInMinutes: controller.exam.time!,
                  onTimerEnd: onTimerEnd,
                ),
              ],
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.quistionList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: context.height * 0.03,
                          ),
                          Text(
                            controller.quistionList[index].question,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (controller.quistionList[index].pic!.isNotEmpty)
                            SizedBox(
                              height: context.height * 0.26,
                              width: context.width * 0.9,
                              child: Image.network(
                                controller.quistionList[index].pic!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          if (controller.quistionList[index].note != null)
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    _openDialog(
                                      controller.quistionList[index].note!,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.question_mark_outlined,
                                    color: AppColors.primary,
                                  ),
                                ),
                                Text(Tr.notes.tr),
                              ],
                            ),
                          const SizedBox(height: 20.0),
                          InputField(
                            onChanged: (value) {
                              controller.quistionList[index].userChoice = value;
                            },
                            hint: Tr.typeAnswer.tr,
                            height: context.height * 0.1,
                          ),
                          const Spacer(),
                          SizedBox(
                            height: context.height * 0.06,
                            width: context.width * 0.8,
                            child: ElevatedButton(
                              onPressed: controller.checkAnswer,
                              child: Text(Tr.confirm.tr),
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
      },
    );
  }
}
