import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss, Trans;
import 'package:queen/queen.dart';
import 'package:quizhub/app/modules/create_matching_exercise/controllers/create_matching_exercise_controller.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/generated/tr.dart';
import 'package:quizhub/views/center_loading.dart';
import 'package:quizhub/views/text_field.dart';

class CreateMatchingExerciseView
    extends GetView<CreateMatchingExerciseController> {
  const CreateMatchingExerciseView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateMatchingExerciseController>(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: context.height * 0.1,
                                width: context.width * 0.45,
                                child: MyTextFeild(
                                  controller: controller.questions[index].word,
                                  hintText: Tr.word.tr,
                                  labelText: Tr.word.tr,
                                ),
                              ),
                              SizedBox(
                                height: context.height * 0.1,
                                width: context.width * 0.45,
                                child: MyTextFeild(
                                  controller:
                                      controller.questions[index].secondWord,
                                  hintText: Tr.relatedWord.tr,
                                  labelText: Tr.relatedWord.tr,
                                ),
                              )
                            ],
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
                          child: controller.isLoading
                              ? const CenterLoading()
                              : const Icon(Icons.save),
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
