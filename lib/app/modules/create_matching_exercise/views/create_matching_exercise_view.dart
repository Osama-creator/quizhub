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
                          )
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
                  child: ElevatedButton(
                    onPressed: () => controller.addQuestion(),
                    child: Text(
                      ' إضافه سؤال',
                      style: context.textTheme.headline6!.copyWith(
                        fontSize: 18,
                        color: AppColors.light,
                      ),
                    ),
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
