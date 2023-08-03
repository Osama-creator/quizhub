import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizhub/app/modules/create_matching_exercise/controllers/create_matching_exercise_controller.dart';
import 'package:quizhub/config/theme.dart';
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
                          Text(
                            'بيانات السؤال ${index + 1}',
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
                                  hintText: "الكلمه ",
                                  labelText: "الكلمه ",
                                ),
                              ),
                              SizedBox(
                                height: context.height * 0.1,
                                width: context.width * 0.45,
                                child: MyTextFeild(
                                  controller:
                                      controller.questions[index].secondWord,
                                  hintText: "الكلمه التابعه",
                                  labelText: "الكلمه التابعه",
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
                          onPressed: () => controller.addQuestion(),
                          child: const Icon(Icons.add),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: context.width * 0.57,
                        child: ElevatedButton(
                          onPressed: () => controller.onSubmit(),
                          child: Text(
                            'إنشاء التدريب',
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
