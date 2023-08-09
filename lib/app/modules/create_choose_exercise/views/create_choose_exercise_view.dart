import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';

import 'package:quizhub/app/modules/create_choose_exercise/controllers/create_choose_exercise_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/text_field.dart';

class CreateChooseExerciseView extends GetView<CreateChooseExerciseController> {
  const CreateChooseExerciseView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateChooseExerciseController>(
      init: controller,
      builder: (controller) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.1,
                ),
                child: const Divider(
                  thickness: 1,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.questions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: AppColors.light,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  controller.removeQuestion(index);
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: AppColors.red,
                                ),
                              ),
                              const Spacer()
                            ],
                          ),
                          Text(
                            '${Tr.questionData.tr} ${index + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: AppColors.primary,
                            ),
                          ),
                          MyTextFeild(
                            controller: controller.questions[index].questionC,
                            hintText: Tr.question.tr,
                            labelText: Tr.question.tr,
                          ),
                          Stack(
                            children: [
                              Container(
                                color: const Color(0x1AD1EC43),
                                width: context.width,
                                height: context.height * 0.15,
                                child: InkWell(
                                  onTap: controller.questions[index].pickFile,
                                  child: controller.questions[index].image ==
                                          null
                                      ? const Icon(
                                          Icons.camera_alt_outlined,
                                          size: 40,
                                          color: AppColors.black,
                                        )
                                      : Image.file(
                                          controller.questions[index].image!,
                                        ),
                                ),
                              ),
                              if (controller.questions[index].image != null)
                                Positioned(
                                  left: 0,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.delete_forever,
                                    ),
                                    onPressed: () {
                                      controller.questions[index].image = null;
                                    },
                                  ),
                                ),
                            ],
                          ),
                          MyTextFeild(
                            controller:
                                controller.questions[index].rightAnswerC,
                            hintText: Tr.correctAnswer.tr,
                            labelText: Tr.correctAnswer.tr,
                          ),
                          MyTextFeild(
                            controller:
                                controller.questions[index].wrongAnswer1C,
                            hintText: Tr.wrongAnswer1.tr,
                            labelText: Tr.wrongAnswer1.tr,
                          ),
                          MyTextFeild(
                            controller:
                                controller.questions[index].wrongAnswer2C,
                            hintText: Tr.wrongAnswer2.tr,
                            labelText: Tr.wrongAnswer2.tr,
                          ),
                          MyTextFeild(
                            controller:
                                controller.questions[index].wrongAnswer3C,
                            hintText: Tr.wrongAnswer3.tr,
                            labelText: Tr.wrongAnswer3.tr,
                          ),
                          MyTextFeild(
                            controller: controller.questions[index].note,
                            hintText: Tr.optionalNote.tr,
                            labelText: Tr.optionalNote.tr,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.1,
                  vertical: 10,
                ),
                child: SizedBox(
                  height: context.height * 0.06,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        width: context.width * 0.2,
                        child: ElevatedButton(
                          onPressed: () => controller.onSubmit(),
                          child: const Icon(Icons.save),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: context.width * 0.57,
                        child: ElevatedButton(
                          onPressed: () => controller.addQuestion(),
                          child: Text(
                            Tr.addQuestion.tr,
                            style: context.textTheme.titleLarge!.copyWith(
                              fontSize: 18,
                              color: AppColors.light,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
